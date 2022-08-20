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
  luaenv uninstall -f $previous

  # get the shiny one
  local latest=$(p6df::modules::lua::luaenv::latest)
  nodenv install -s $latest

  nodenv global $latest
  nodenv rehash

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::lua::luaenv::latest()
#
#>
######################################################################
p6df::modules::lua::luaenv::latest() {

  luaenv install -l | p6_filter_select "5" | p6_filter_exclude jit | p6_filter_last "1" | p6_filter_spaces_strip
}

######################################################################
#<
#
# Function: p6df::modules::lua::luaenv::latest()
#
#>
######################################################################
p6df::modules::lua::luaenv::latest() {

  luaenv install -l | p6_filter_select "5" | p6_filter_exclude jit | p6_filter_from_end "2" | p6_filter_spaces_strip
}

######################################################################
#<
#
# Function: str str = p6df::modules::lua::env::prompt::info()
#
#  Returns:
#	str - str
#
#  Environment:	 LUAENV_ROOT
#>
######################################################################
p6df::modules::lua::env::prompt::info() {

  local str="lua_root:\t  $LUAENV_ROOT"

  p6_return_str "$str"
}
