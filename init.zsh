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
# Function: p6df::modules::lua::init(_module, dir)
#
#  Args:
#	_module -
#	dir -
#
#  Environment:	 P6_DFZ_SRC_DIR
#>
######################################################################
p6df::modules::lua::init() {
  local _module="$1"
  local dir="$2"

  p6_bootstrap "$dir"

  p6df::core::lang::mgr::init "$P6_DFZ_SRC_DIR/cehoffman/luaenv" "lua"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::lua::home::symlink()
#
#  Environment:	 P6_SRC_DIR
#>
######################################################################
p6df::modules::lua::home::symlink() {

  p6_dir_mk "$P6_SRC_DIR/cehoffman/luaenv/plungins"
  p6_file_symlink "$P6_SRC_DIR/cehoffman/luaenv/plungins/lua-build" "$P6_DFZ_SRC_DIR/cehoffman/lua-build"
  p6_file_symlink "$P6_SRC_DIR/cehoffman/luaenv/plungins/luaenv-luarocks" "$P6_DFZ_SRC_DIR/xpol/luaenv-luarocks"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::lua::langs()
#
#>
######################################################################
p6df::modules::lua::langs() {

  # nuke the old one
  local previous=$(p6df::modules::lua::luaenv::latest::installed)
  luaenv uninstall -f "$previous"

  # get the shiny one
  local latest=$(p6df::modules::lua::luaenv::latest)
  luaenv install -s "$latest"

  luaenv global "$latest"
  luaenv rehash

  p6_return_void
}

######################################################################
#<
#
# Function: str str = p6df::modules::lua::prompt::env()
#
#  Returns:
#	str - str
#
#>
######################################################################
p6df::modules::lua::prompt::env() {

#  local str="lua_root:\t  $LUAENV_ROOT"
  local str=""

  p6_return_str "$str"
}

######################################################################
#<
#
# Function: p6df::modules::lua::prompt::lang()
#
#>
######################################################################
p6df::modules::lua::prompt::lang() {

  local ver

  local ver_mgr
  ver_mgr=$(luaenv version-name 2>/dev/null)
  if p6_string_eq "$ver_mgr" "system"; then
    local ver_sys="sys@"
    local v
    v=$(lua  -v | awk '{print $2}')
    if p6_string_blank "$v"; then
      ver_sys="sys:no"
    fi
    ver="$ver_sys"
  else
    ver="$ver_mgr"
  fi

  local str="lua:$ver"

  p6_return "$str"
}
