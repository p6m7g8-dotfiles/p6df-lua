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
#  Environment:	 P6_DFZ_SRC_DIR
#>
######################################################################
p6df::modules::lua::init() {

  p6df::modules::lua::luaenv::init "$P6_DFZ_SRC_DIR"

  p6df::modules::lua::prompt::init
}

######################################################################
#<
#
# Function: p6df::modules::lua::prompt::init()
#
#>
######################################################################
p6df::modules::lua::prompt::init() {

  p6df::core::prompt::line::add "p6_lang_prompt_info"
  p6df::core::prompt::line::add "p6_lang_envs_prompt_info"
  p6df::core::prompt::lang::line::add lua
}

######################################################################
#<
#
# Function: p6df::modules::lua::luaenv::init(dir)
#
#  Args:
#	dir -
#
#  Environment:	 DISABLE_ENVS HAS_LUAENV LUAENV_ROOT
#>
######################################################################
p6df::modules::lua::luaenv::init() {
  local dir="$1"

  [ -n "$DISABLE_ENVS" ] && return

  LUAENV_ROOT=$dir/cehoffman/luaenv

  if [ -x $LUAENV_ROOT/bin/luaenv ]; then
    export LUAENV_ROOT
    export HAS_LUAENV=1

    p6_path_if $LUAENV_ROOT/bin
    eval "$(p6_run_code luaenv init - zsh)"
  fi
}

######################################################################
#<
#
# Function: str str = p6_lua_env_prompt_info()
#
#  Returns:
#	str - str
#
#  Environment:	 LUAENV_ROOT
#>
######################################################################
p6_lua_env_prompt_info() {

  local str="lua_root:\t  $LUAENV_ROOT"

  p6_return_str "$str"
}
