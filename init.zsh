######################################################################
#<
#
# Function: p6df::modules::lua::deps()
#
#>
######################################################################
p6df::modules::lua::deps() {
  ModuleDeps=(
    p6m7g8-dotfiles/p6common
    cehoffman/luaenv
    cehoffman/lua-build
    xpol/luaenv-luarocks
  )
}

######################################################################
#<
#
# Function: p6df::modules::lua::init()
#
#>
######################################################################
p6df::modules::lua::init() {

  p6df::modules::lua::luaenv::init "$P6_DFZ_SRC_DIR"
}

######################################################################
#<
#
# Function: p6df::modules::lua::luaenv::init(dir)
#
#  Args:
#	dir -
#
#>
######################################################################
p6df::modules::lua::luaenv::init() {
  local dir="$1"

  [ -n "$DISABLE_ENVS" ] && return

  LUAENV_ROOT=$dir/cehoffman/luaenv

  if [ -x $LUAENV_ROOT/bin/luaenv ]; then
    export LUAENV_ROOT
    export HAS_LUAENV=1

    p6df::util::path_if $LUAENV_ROOT/bin
    eval "$(p6_run_code luaenv init - zsh)"
  fi
}

######################################################################
#<
#
# Function: p6df::modules::lua::prompt::line()
#
#>
######################################################################
p6df::modules::lua::prompt::line() {

  p6_lua_prompt_info
}

######################################################################
#<
#
# Function: p6_lua_prompt_info()
#
#>
######################################################################
p6_lua_prompt_info() {

  echo -n "lua:\t  "
  p6_lang_version "lua"
}
