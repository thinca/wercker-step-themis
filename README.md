# Wercker step for themis.vim

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
