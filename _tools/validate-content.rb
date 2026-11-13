# Validate YAML syntax and required content fields without adding dependencies.
# Run with: bundle _2.6.9_ exec ruby _tools/validate-content.rb

require "date"
require "pathname"
require "yaml"

ROOT = File.expand_path("..", __dir__)
errors = []

def read_yaml(path, errors)
  YAML.safe_load_file(path, permitted_classes: [Date, Time], aliases: true)
rescue Psych::Exception => error
  errors << "#{Pathname.new(path).relative_path_from(Pathname.new(ROOT))}: YAML parse error: #{error.message.lines.first.strip}"
  nil
end

def required_fields(records, fields, label, errors)
  unless records.is_a?(Array)
    errors << "#{label}: expected a list of records"
    return
  end

  records.each_with_index do |record, index|
    unless record.is_a?(Hash)
      errors << "#{label}[#{index}]: expected a mapping"
      next
    end

    fields.each do |field|
      value = record[field]
      errors << "#{label}[#{index}]: missing required field #{field.inspect}" if value.nil? || value.to_s.strip.empty?
    end
  end
end

def unique_ids(records, label, errors)
  return unless records.is_a?(Array)

  seen = {}
  records.each_with_index do |record, index|
    next unless record.is_a?(Hash)

    id = record["id"].to_s.strip
    if id.empty?
      errors << "#{label}[#{index}]: missing required field \"id\""
    elsif seen.key?(id)
      errors << "#{label}[#{index}]: duplicate id #{id.inspect} (also at index #{seen[id]})"
    else
      seen[id] = index
    end
  end
end

config_path = File.join(ROOT, "_config.yml")
config = read_yaml(config_path, errors)
if config.is_a?(Hash)
  %w[title url].each do |field|
    errors << "_config.yml: missing required field #{field.inspect}" if config[field].to_s.strip.empty?
  end
  navigation = config["navigation"]
  unless navigation.is_a?(Array) && !navigation.empty?
    errors << "_config.yml: navigation must be a non-empty list"
  else
    required_fields(navigation, %w[title url], "_config.yml navigation", errors)
  end
end

# Parse all content data and keep the parsed records for field-level checks.
data = {}
Dir.glob("_data/*.yml", base: ROOT).sort.each do |relative_path|
  path = File.join(ROOT, relative_path)
  data[File.basename(path, ".yml")] = read_yaml(path, errors)
end

# Parse page front matter as well as data/config YAML.
Dir.glob("*.{md,html}", base: ROOT).sort.each do |relative_path|
  path = File.join(ROOT, relative_path)
  content = File.read(path)
  match = content.match(/\A---\s*\r?\n(.*?)\r?\n---(?:\s|$)/m)
  next unless match

  begin
    YAML.safe_load(match[1], permitted_classes: [Date, Time], aliases: true)
  rescue Psych::Exception => error
    errors << "#{File.basename(path)}: front matter YAML parse error: #{error.message.lines.first.strip}"
  end
end

papers = data["papers"]
required_fields(papers, %w[id type title author year], "_data/papers.yml", errors)
unique_ids(papers, "_data/papers.yml", errors)
if papers.is_a?(Array)
  supported_types = %w[article inproceedings book phdthesis]
  papers.each_with_index do |paper, index|
    next unless paper.is_a?(Hash) && paper["type"]
    next if supported_types.include?(paper["type"])

    errors << "_data/papers.yml[#{index}]: unsupported publication type #{paper['type'].inspect}"
  end
end

portfolio = data["portfolio"]
required_fields(portfolio, %w[id title category summary], "_data/portfolio.yml", errors)
unique_ids(portfolio, "_data/portfolio.yml", errors)

research = data["research"]
research_topics = research.is_a?(Hash) ? research["topics"] : nil
required_fields(research_topics, %w[id title summary], "_data/research.yml topics", errors)
unique_ids(research_topics, "_data/research.yml topics", errors)

teaching = data["teaching"]
teaching_ids = []
if teaching.is_a?(Hash)
  modules = teaching["modules"]
  required_fields(modules, %w[id title institution years role description], "_data/teaching.yml modules", errors)
  unique_ids(modules, "_data/teaching.yml modules", errors)
  teaching_ids.concat(Array(modules).filter_map { |record| record["id"] if record.is_a?(Hash) })
  required_fields(teaching["experience"], %w[title year institution role description], "_data/teaching.yml experience", errors)
  supervision = teaching["supervision"]
  unless supervision.nil?
    required_fields([supervision], %w[id title years institution description], "_data/teaching.yml supervision", errors)
    teaching_ids << supervision["id"] if supervision.is_a?(Hash) && supervision["id"]
  end
end

links = data["links"]
required_fields([links], %w[github linkedin researchgate scholar cv twitter], "_data/links.yml", errors) if links

skills = data["skills"]
required_fields(skills, %w[category skills], "_data/skills.yml", errors)

portfolio_ids = Array(portfolio).filter_map { |record| record["id"] if record.is_a?(Hash) }
paper_ids = Array(papers).filter_map { |record| record["id"] if record.is_a?(Hash) }

def validate_references(records, fields, allowed_ids, label, errors)
  return unless records.is_a?(Array)

  records.each_with_index do |record, index|
    next unless record.is_a?(Hash)

    fields.each do |field|
      Array(record[field]).each do |reference|
        next if allowed_ids.include?(reference)

        errors << "#{label}[#{index}]: #{field} references unknown id #{reference.inspect}"
      end
    end
  end
end

validate_references(research_topics, %w[portfolio], portfolio_ids, "_data/research.yml topics", errors)
validate_references(research_topics, %w[publications], paper_ids, "_data/research.yml topics", errors)

timeline = data["timeline"]
required_fields(timeline, %w[id year title organisation description], "_data/timeline.yml", errors)
unique_ids(timeline, "_data/timeline.yml", errors)
validate_references(timeline, %w[portfolio], portfolio_ids, "_data/timeline.yml", errors)
validate_references(timeline, %w[teaching], teaching_ids, "_data/timeline.yml", errors)

if errors.empty?
  puts "Content validation passed (YAML syntax, required fields, and unique IDs)."
  exit 0
end

warn "Content validation failed (#{errors.length} issue#{errors.length == 1 ? '' : 's'}):"
errors.each { |error| warn "  #{error}" }
exit 1
