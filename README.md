# P6's POSIX.2: p6df-lua

## Table of Contents

- [Badges](#badges)
- [Summary](#summary)
- [Contributing](#contributing)
- [Code of Conduct](#code-of-conduct)
- [Usage](#usage)
  - [Functions](#functions)
- [Hierarchy](#hierarchy)
- [Author](#author)

## Badges

[![License](https://img.shields.io/badge/License-Apache%202.0-yellowgreen.svg)](https://opensource.org/licenses/Apache-2.0)

## Summary

TODO: Add a short summary of this module.

## Contributing

- [How to Contribute](<https://github.com/p6m7g8-dotfiles/.github/blob/main/CONTRIBUTING.md>)

## Code of Conduct

- [Code of Conduct](<https://github.com/p6m7g8-dotfiles/.github/blob/main/CODE_OF_CONDUCT.md>)

## Usage

### Functions

#### p6df-lua

##### p6df-lua/init.zsh

- `p6df::modules::lua::deps()`
- `p6df::modules::lua::home::symlink()`
- `p6df::modules::lua::init(_module, dir)`
- `p6df::modules::lua::langs()`
- `str str = p6df::modules::lua::prompt::env()`
- `str str = p6df::modules::lua::prompt::lang()`

#### p6df-lua/lib

##### p6df-lua/lib/luaenv.sh

- `p6df::modules::lua::luaenv::latest()`
- `p6df::modules::lua::luaenv::latest::installed()`

## Hierarchy

```text
.
├── init.zsh
├── lib
│   └── luaenv.sh
└── README.md

2 directories, 3 files
```

## Author

Philip M. Gollucci <pgollucci@p6m7g8.com>
