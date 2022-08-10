# shellcheck shell=bash
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

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::lua::luaenv::init(dir)
#
#  Args:
#	dir -
#
#  Environment:	 HAS_LUAENV LUAENV_ROOT P6_DFZ_LANGS_DISABLE
#>
######################################################################
p6df::modules::lua::luaenv::init() {
  local dir="$1"

  local LUAENV_ROOT=$dir/cehoffman/luaenv
  if p6_string_blank "$P6_DFZ_LANGS_DISABLE" && p6_file_executable "$LUAENV_ROOT/bin/luaenv"; then
    p6_env_export LUAENV_ROOT "$LUAENV_ROOT"
    p6_env_export HAS_LUAENV 1

    p6_path_if $LUAENV_ROOT/bin
    eval "$(luaenv init - zsh)"
  fi

  p6_return_void
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
