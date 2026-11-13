Raluca Gaina Portfolio

Built with Jekyll
Hosted with GitHub Pages

## Project documentation

- [Architecture overview](architecture-overview.md)
- [Milestones and implementation status](milestones.md)
- [Data model and YAML conventions](data-model.md)
- [Ruby and locked dependency upgrade plan](ruby-upgrade-plan.md)
- [Projects and portfolio expansion plan](portfolio-planning.md)

## Validate content and references

Run the lightweight content and local-reference checks with the locked Ruby dependencies:

```sh
bundle _2.6.9_ exec ruby _tools/validate-content.rb
bundle _2.6.9_ exec ruby _tools/check-local-references.rb
```

The content check parses configuration, page front matter and data YAML, then checks required fields and stable record IDs. The reference check checks local routes and assets. After a successful build, it can also inspect generated HTML:

```sh
bundle _2.6.9_ exec jekyll build --baseurl=""
bundle _2.6.9_ exec ruby _tools/check-local-references.rb _site
```

External URLs are not checked for availability.
