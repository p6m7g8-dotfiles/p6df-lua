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
# Function: p6df::modules::lua::langmgr::init()
#
#  Environment:	 P6_DFZ_SRC_DIR
#>
######################################################################
p6df::modules::lua::langmgr::init() {

  p6df::core::lang::mgr::init "$P6_DFZ_SRC_DIR/cehoffman/luaenv" "lua"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::lua::home::symlinks()
#
#  Environment:	 P6_DFZ_SRC_DIR P6_SRC_DIR
#>
######################################################################
p6df::modules::lua::home::symlinks() {

  p6_dir_mk "$P6_SRC_DIR/cehoffman/luaenv/plugins"
  p6_file_symlink "$P6_SRC_DIR/cehoffman/luaenv/plugins/lua-build" "$P6_DFZ_SRC_DIR/cehoffman/lua-build"
  p6_file_symlink "$P6_SRC_DIR/cehoffman/luaenv/plugins/luaenv-luarocks" "$P6_DFZ_SRC_DIR/xpol/luaenv-luarocks"

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
# Function: str str = p6df::modules::lua::prompt::lang()
#
#  Returns:
#	str - str
#
#>
######################################################################
p6df::modules::lua::prompt::lang() {

  local str
  str=$(p6df::core::lang::prompt::lang \
    "lua" \
    "luaenv version-name 2>/dev/null" \
    "lua -v | p6_filter_column_pluck 2")

  p6_return_str "$str"
}

######################################################################
#<
#
# Function: words lua $LUAENV_ROOT = p6df::modules::lua::prompt::env()
#
#  Returns:
#	words - lua $LUAENV_ROOT
#
#  Environment:	 LUAENV_ROOT
#>
######################################################################
p6df::modules::lua::prompt::env() {

  p6_return_words 'lua' '$LUAENV_ROOT'
}
