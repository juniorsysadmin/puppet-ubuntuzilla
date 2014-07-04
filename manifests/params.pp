# == Class: ubuntuzilla::params
#
# Default parameter values for the ubuntuzilla module
#
class ubuntuzilla::params {
  $ubuntuzilla_include_src = false
  $ubuntuzilla_key         = 'C1289A29'
  $ubuntuzilla_key_server  = 'keyserver.ubuntu.com'
  $ubuntuzilla_location    = 'http://downloads.sourceforge.net/project/ubuntuzilla/mozilla/apt'
  $ubuntuzilla_release     = 'all'
  $ubuntuzilla_repos       = 'main'
}