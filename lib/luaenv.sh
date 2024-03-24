# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::lua::luaenv::latest()
#
#>
######################################################################
p6df::modules::lua::luaenv::latest() {

  luaenv install -l | p6_filter_select "5" | p6_filter_exclude jit | p6_filter_last "1" | p6_filter_spaces_strip

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

  luaenv install -l | p6_filter_select "5" | p6_filter_exclude jit | p6_filter_from_end "2" | p6_filter_spaces_strip

  p6_return_void
}
