# Check source HTML/templates, YAML data, and optionally generated HTML for broken local references.
# Run directly against source: bundle exec ruby _tools/check-local-references.rb
# Or include generated routes: bundle exec ruby _tools/check-local-references.rb <site-dir>

require "nokogiri"
require "date"
require "pathname"
require "set"
require "uri"
require "yaml"

repo_root = File.expand_path("..", __dir__)
site_root = File.expand_path(ARGV[0]) if ARGV[0]
source_mode = site_root.nil?
site_root ||= repo_root
unless Dir.exist?(site_root)
  warn "Reference directory not found: #{site_root}"
  exit 2
end
missing = []

def local_target_exists?(site_root, path)
  clean_path = URI::DEFAULT_PARSER.unescape(path.split(/[?#]/, 2).first)
  clean_path = "/" if clean_path.empty?
  target = File.expand_path(clean_path.delete_prefix("/"), site_root)
  return false unless target == site_root || target.start_with?(site_root + File::SEPARATOR)

  return true if File.file?(target)
  return true if File.directory?(target) && File.file?(File.join(target, "index.html"))
  return true if File.extname(target).empty? && File.file?(target + ".html")
  return true if File.extname(target) == ".css" && File.file?(target.sub(/\.css\z/, ".scss"))

  false
end

def local_path?(value)
  return false if value.nil? || value.empty? || value.start_with?("#", "//")

  uri = URI.parse(value)
  uri.scheme.nil? && uri.host.nil?
rescue URI::InvalidURIError
  false
end

source_routes = Set.new(["/"])
if source_mode
  Dir.children(repo_root).grep(/\.md\z/).each do |markdown_name|
    begin
      markdown_file = File.join(repo_root, markdown_name)
      front_matter = File.read(markdown_file).match(/\A---\s*\r?\n(.*?)\r?\n---/m)&.captures&.first
      metadata = front_matter ? YAML.safe_load(front_matter) || {} : {}
      route = metadata["permalink"] || "/#{File.basename(markdown_file, ".md")}/"
      route_path = route.to_s.sub(%r{\A/+}, "").sub(%r{/+$}, "")
      source_routes << "/#{route_path}/"
    rescue Psych::Exception => error
      missing << "#{File.basename(markdown_file)}: YAML parse error: #{error.message.lines.first.strip}"
    end
  end
  Dir.children(repo_root).grep(/\.html\z/).each do |html_name|
    source_routes << "/#{html_name}"
  end
end

begin
  config = YAML.safe_load_file(File.join(repo_root, "_config.yml"), aliases: true)
  seen_navigation_urls = Set.new
  Array(config["navigation"]).each do |item|
    url = item.is_a?(Hash) ? item["url"].to_s : ""
    if url.empty? || !url.start_with?("/")
      missing << "_config.yml: navigation entry has an invalid local URL #{url.inspect}"
      next
    end
    if seen_navigation_urls.include?(url)
      missing << "_config.yml: duplicate navigation URL #{url.inspect}"
      next
    end

    seen_navigation_urls << url
    next if local_target_exists?(site_root, url)
    route_path = url.sub(%r{\A/+}, "").sub(%r{/+$}, "")
    next if source_mode && source_routes.include?("/#{route_path}/")

    missing << "_config.yml: navigation URL does not match a known route: #{url.inspect}"
  end
rescue Psych::Exception => error
  missing << "_config.yml: YAML parse error: #{error.message.lines.first.strip}"
end

html_files = if source_mode
  root_markup = Dir.children(site_root).grep(/\.(?:html|md)\z/).map { |name| File.join(site_root, name) }
  nested_markup = %w[_includes/**/*.html _layouts/**/*.html].flat_map do |pattern|
    Dir.glob(pattern, base: site_root).map { |name| File.join(site_root, name) }
  end
  root_markup + nested_markup
else
  Dir.glob("**/*.html", base: site_root).map { |name| File.join(site_root, name) }
end

html_files.uniq.sort.each do |html_file|
  document = Nokogiri::HTML(File.read(html_file))
  document.css("[href], [src], [poster]").each do |node|
    %w[href src poster].each do |attribute|
      value = node[attribute]&.strip
      if attribute == "href" && value == ""
        relative_html = Pathname.new(html_file).relative_path_from(Pathname.new(site_root))
        missing << "#{relative_html}: empty href"
        next
      end
      if source_mode && value&.include?("{{")
        next if value.include?("append")
        value = value.match(/['"](?<path>\/[^'"]+)['"]/)&.[](:path)
      end
      next unless local_path?(value)
      next if local_target_exists?(site_root, value)
      if source_mode
        path = URI.parse(value).path
        route_path = path.to_s.sub(%r{\A/+}, "").sub(%r{/+$}, "")
        route = "/#{route_path}/"
        next if source_routes.include?(route) || source_routes.include?(path)
      end

      relative_html = Pathname.new(html_file).relative_path_from(Pathname.new(site_root))
      missing << "#{relative_html}: #{attribute}=#{value.inspect}"
    end
  end
end

Dir.glob("_data/*.yml", base: repo_root).map { |name| File.join(repo_root, name) }.sort.each do |yaml_file|
  begin
    data = YAML.safe_load_file(yaml_file, permitted_classes: [Date, Time], aliases: true)
    visit = lambda do |value, key_path|
      case value
      when Hash
        value.each { |key, child| visit.call(child, "#{key_path}.#{key}") }
      when Array
        value.each_with_index { |child, index| visit.call(child, "#{key_path}[#{index}]") }
      when String
        next unless value.start_with?("/assets/")
        next if local_target_exists?(site_root, value)

        relative_yaml = Pathname.new(yaml_file).relative_path_from(Pathname.new(repo_root))
        missing << "#{relative_yaml}: #{key_path}=#{value.inspect}"
      end
    end
    visit.call(data, File.basename(yaml_file))
  rescue Psych::Exception => error
    missing << "#{yaml_file}: YAML parse error: #{error.message.lines.first.strip}"
  end
end

papers_file = File.join(repo_root, "_data", "papers.yml")
if File.file?(papers_file)
  begin
    papers = YAML.safe_load_file(papers_file, aliases: true)
    Array(papers).each do |paper|
      next unless paper.is_a?(Hash) && paper["id"]

      expected = []
      expected << "/assets/pdf/papers/#{paper['id']}.pdf" if paper["pdf"]
      expected << "/assets/pdf/#{paper['id']}.pdf" if paper["talkpdf"]
      expected << "/assets/ppt/#{paper['id']}.pptx" if paper["talkppt"]
      expected.each do |path|
        next if local_target_exists?(site_root, path)

        missing << "_data/papers.yml: #{paper['id']} references missing #{path}"
      end
    end
  rescue Psych::Exception => error
    missing << "_data/papers.yml: YAML parse error: #{error.message.lines.first.strip}"
  end
end

if missing.empty?
  puts "Local reference check passed."
  exit 0
end

warn "Missing local references (#{missing.length}):"
missing.each { |reference| warn "  #{reference}" }
exit 1
