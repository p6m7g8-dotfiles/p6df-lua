# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::lua::luaenv::latest()
#
#>
######################################################################
p6df::modules::lua::luaenv::latest() {

  luaenv install -l | p6_filter_row_select "5" | p6_filter_row_exclude jit | p6_filter_row_last "1" | p6_filter_strip_spaces

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::lua::luaenv::latest::installed()
#
#>
######################################################################
p6df::modules::lua::luaenv::latest::installed() {

  luaenv install -l | p6_filter_row_select "5" | p6_filter_row_exclude jit | p6_filter_row_last "2" | p6_filter_strip_spaces

  p6_return_void
}
