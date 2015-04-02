# Wercker step for themis.vim [![wercker status](https://app.wercker.com/status/6b59755a17d8737291699b8061ef04ac/s "wercker status")](https://app.wercker.com/project/bykey/6b59755a17d8737291699b8061ef04ac)

This Wercker step runs test for Vim script with [themis.vim](https://github.com/thinca/vim-themis).

### Options

All properties are optional.

- `version`
  - Version of themis. (ex. `v1.4`)
  - Default: `master`
- `test-dir`
  - A directory the tests are placed.
  - Default: `(empty)`
- `reporter`
  - Name of reporter.
  - Default: `dot`
- `runtimepath`
  - List of runtimepaths separated by comma.
  - Default: `(empty)`
