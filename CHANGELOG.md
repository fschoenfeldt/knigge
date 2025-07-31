# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed

- **BREAKING**: Changed package name from `knigge` to `ex_knigge` to distinguish from original package
- **BREAKING**: Minimum Elixir version raised from `>= 1.7.4` to `>= 1.18.0`
- Updated Elixir from 1.12.2 to 1.18.4-otp-27
- Updated Erlang/OTP from 23.3.4.5 to 27.3.4.1
- Migrated from custom CI configuration to streamlined `ex_check` workflow
- Updated all configuration files from deprecated `use Mix.Config` to modern `import Config`
- Changed `Mix.env()` to `config_env()` in config files for better compatibility
- Updated dependencies:
  - `bunt` from `~> 0.2` to `~> 1.0`
  - `credo` from `>= 1.0.0` to `~> 1.7`
  - `dialyxir` from `~> 1.0` to `~> 1.4`
  - `ex_doc` from `~> 0.23` to `>= 0.0.0`
  - `mox` from `~> 0.5` to `~> 1.0`
- Removed `inch_ex` dependency (docs-only)
- Added Frederik Schönfeldt as maintainer

### Added

- Added GitHub Dependabot configuration for automatic dependency updates
- Added comprehensive CLI environment configuration for better test tooling integration

### Quality

- Applied `mix format` for consistent code style throughout the project
- Added `ex_check` dependency for unified code quality checks with custom `.check.exs` configuration
- Added coveralls integration to ex_check workflow
- Simplified dialyzer configuration with improved PLT handling

### Infrastructure

- Simplified CI workflow from complex matrix builds to single `mix check` job
- Updated GitHub Actions versions (checkout@v4, cache@v4, asdf-vm/actions/install@v4)
- Modernized caching strategy for better build performance
- Added automated dependency management via Dependabot

## [1.4.1] - 2021-10-03

### Changed

- [#26](https://github.com/alexocode/knigge/issues/26): Fix upgrade building by tagging `bunt` as `runtime: false`

## [1.4.0] - 2021-03-26

### Added

- [#18](https://github.com/alexocode/knigge/pull/18): Add `default` option to `use Knigge` ([@NickNeck][])
- [#22](https://github.com/alexocode/knigge/pull/22): Ease contributing by adding a CONTRIBUTING guide and a PULL_REQUEST_TEMPLATE ([@alexocode])

### Changed

- [#19](https://github.com/alexocode/knigge/pull/19): Fix handling of callbacks without brackets ([@NickNeck])

## [1.3.0] - 2020-11-27

### Added

- [#15](https://github.com/alexocode/knigge/pull/15): Add `--app` switch to `mix knigge.verify` ([@polvalente])

### Changed

- [#16](https://github.com/alexocode/knigge/pull/16): Migrate CI from CircleCI to GitHub actions ([@alexocode])

## [1.2.0] - 2020-09-07

### Changed

- Replaced the existence check with `mix knigge.verify`, see [here for details on why](https://hexdocs.pm/knigge/the-existence-check.html) ([@alexocode])

## [1.1.1] - 2019-10-13

### Changed

- [#9](https://github.com/alexocode/knigge/pull/9): Avoid warning when callback is defined several times ([@alexcastano])

## [1.1.0] - 2019-10-13

### Changed

- Renamed `delegate_at` to `delegate_at_runtime?` and changed it to accept a list of environment names instead of only a boolean;
  the default has been changed to `only: :test` ([@alexocode])

[Unreleased]: https://github.com/alexocode/knigge/compare/v1.4.1...main
[1.4.1]: https://github.com/alexocode/knigge/compare/v1.4.0...v1.4.1
[1.4.0]: https://github.com/alexocode/knigge/compare/v1.3.0...v1.4.0
[1.3.0]: https://github.com/alexocode/knigge/compare/v1.2.0...v1.3.0
[1.2.0]: https://github.com/alexocode/knigge/compare/v1.1.1...v1.2.0
[1.1.1]: https://github.com/alexocode/knigge/compare/v1.1.0...v1.1.1
[1.1.0]: https://github.com/alexocode/knigge/compare/v1.0.4...v1.1.0
[@alexcastano]: https://github.com/alexcastano
[@NickNeck]: https://github.com/NickNeck
[@polvalente]: https://github.com/polvalente
[@alexocode]: https://github.com/alexocode
