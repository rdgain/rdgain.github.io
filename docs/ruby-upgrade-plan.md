# Ruby and locked dependency upgrade plan

## Status

Planning only. No Ruby version, Gemfile, or Gemfile.lock changes have been made.

## Recommendation

The pasted lockfile suggestion cannot be installed with the current local Ruby 3.1.7. It raises several transitive gems beyond that runtime's supported range:

| Gem | Current lock | Suggested lock | Ruby requirement in suggested version |
| --- | --- | --- | --- |
| `activesupport` | 7.2.4 | 8.0.5.2 | Ruby >= 3.2 |
| `connection_pool` | 2.5.5 | 3.0.2 | Ruby >= 3.2 |
| `minitest` | 5.27.0 | 6.1.0 | Ruby >= 3.2 |

The suggestion leaves `github-pages` 233, Jekyll 3.10.0 and `jekyll-sass-converter` 1.5.2 unchanged. It also adds the `x86_64-linux` Bundler platform alongside Windows, which is useful for Linux CI.

Ruby 3.2 is already end-of-life. Ruby 3.3 is in security maintenance with expected EOL on 31 March 2027, while Ruby 3.4 is in normal maintenance. The GitHub Pages dependency-version page last published Ruby 3.3.4 as its build runtime (the page says it was last updated 13 August 2025). Use the latest Ruby 3.3 patch as the initial local parity target, and test Ruby 3.4.x in CI at the same time. Move the default to 3.4 only after the locked build passes and the active GitHub Pages deployment path is confirmed compatible. This keeps the first step close to the documented Pages runtime while avoiding Ruby 3.2 as a long-term target.

References: [Ruby branch maintenance](https://www.ruby-lang.org/en/downloads/branches/), [GitHub Pages dependency versions](https://pages.github.com/versions/), [GitHub Pages gem compatibility goals](https://github.com/github/pages-gem), [ActiveSupport 8.0.5.2 requirements](https://rubygems.org/gems/activesupport/versions/8.0.5.2), [connection_pool 3.0.2 requirements](https://rubygems.org/gems/connection_pool/versions/3.0.2), and [Minitest 6.1.0 requirements](https://rubygems.org/gems/minitest/versions/6.1.0).

## Proposed steps

1. **Preserve the current baseline.** Keep the existing Gemfile, lockfile and passing source validators available for rollback. Do not update the GitHub Pages gem, Jekyll or Sass converter as part of the first runtime transition.
2. **Choose and pin the Ruby runtime.** Add a `.ruby-version` file for the latest available Ruby 3.3 patch. Add a compatible Ruby constraint to the Gemfile if desired, and use the same runtime in local setup and GitHub Actions. Keep Bundler at 2.6.9 initially.
3. **Add the Linux lockfile platform.** Run `bundle _2.6.9_ lock --add-platform x86_64-linux` while retaining `x64-mingw-ucrt`, rather than hand-editing platform-specific gems or checksums.
4. **Refresh only the dependencies that need the newer Ruby.** With Ruby 3.3 active, run `bundle _2.6.9_ update activesupport connection_pool minitest`. Keep `github-pages` 233, Jekyll 3.10.0 and `jekyll-sass-converter` 1.5.2 pinned. Review the complete lockfile diff for any unrelated transitive upgrades.
5. **Build and validate on Windows and Linux.** Run `bundle _2.6.9_ check`, the content validator, the local-reference checker, `bundle _2.6.9_ exec jekyll build --baseurl=""`, and the generated-site reference check. Use an Ubuntu GitHub Actions runner for the Linux build; test Ruby 3.4.x as a matrix candidate before changing the default runtime.
6. **Check GitHub Pages compatibility.** Confirm the Pages build uses a compatible Ruby and the same GitHub Pages gem stack. The `github-pages` gem aims to keep local and server builds aligned. Confirm the deployed preview after the checks pass; do not switch the publishing source or deploy through Actions as part of this upgrade.
7. **Track the Sass issue separately.** The current Windows build reports that the Sass converter cannot resolve the local `variables` partial. A runtime upgrade may or may not change that Windows path behavior. Keep the original `_sass` imports unless an actual build demonstrates a source-level fix, and require the Ubuntu generated-site build to pass before calling Sass validation complete.
8. **Commit as a reviewable upgrade.** Keep the Ruby pin, Gemfile change (if any), lockfile and CI change together, with the dependency diff and validation result recorded. If any platform fails, restore the previous Ruby pin and lockfile before investigating further.

## Expected file changes when authorized

- Add `.ruby-version` with the chosen Ruby release.
- Update `Gemfile.lock` using Bundler, adding the Linux platform and only necessary compatible dependency changes.
- Add or update a build workflow to install the pinned Ruby and Bundler, run content/reference validation, build Jekyll and inspect generated routes.
- Update `Gemfile` only if an explicit Ruby version constraint is adopted or Bundler requires a dependency declaration change.

## Acceptance criteria

- The lockfile installs on the selected Windows and Linux Ruby runtimes without unmet Ruby requirements.
- `github-pages`, Jekyll and Sass converter versions remain unchanged during the initial runtime update.
- Content validation, source and generated reference checks pass.
- Jekyll builds on Ubuntu and on the local Windows runtime, or any remaining Windows-only Sass path limitation is documented separately and the production-compatible Linux build passes.
- The chosen runtime is compatible with the active GitHub Pages publishing path and the deployment is verified before the upgrade is treated as complete.

## Rollback

Restore the previous `.ruby-version`/Gemfile state and `Gemfile.lock`, remove the failed workflow change if it is part of the same upgrade, then rerun the previous validation commands. Do not publish a runtime/dependency update until the intended GitHub Pages build has passed.
