# == Class: ubuntuzilla
#
# Module to install the Ubuntuzilla repository. When run on a non-Debian
# osfamily it exits with no action performed.
#
# === Parameters
#
# [*ubuntuzilla_include_src*]
#   Used by apt::source. Defaults to false.
#
# [*ubuntuzilla_key*]
#   Used by apt::source. Defaults to the official Ubuntuzilla one.
#
# [*ubuntuzilla_key_server*]
#   Used by apt::source. Defaults to keyserver.ubuntu.com
#
# [*ubuntuzilla_location*]
#   Location of Ubuntuzilla repository. Defaults to
#   http://downloads.sourceforge.net/project/ubuntuzilla/mozilla/apt
#
# [*ubuntuzilla_release*]
#   Used by apt::source. Defaults to all.
#
# [*ubuntuzilla_repos*]
#   Used by apt::source. Defaults to main.
#
# === Usage
#
# include '::ubuntuzilla'
#
# or to use a local mirror:
#
#  class { 'ubuntuzilla':
#    ubuntuzilla_location => 'http://localmirror.server.domain',
#  }
#
class ubuntuzilla (
  $ubuntuzilla_include_src = $ubuntuzilla::params::ubuntuzilla_include_src,
  $ubuntuzilla_key         = $ubuntuzilla::params::ubuntuzilla_key,
  $ubuntuzilla_key_server  = $ubuntuzilla::params::ubuntuzilla_key_server,
  $ubuntuzilla_location    = $ubuntuzilla::params::ubuntuzilla_location,
  $ubuntuzilla_release     = $ubuntuzilla::params::ubuntuzilla_release,
  $ubuntuzilla_repos       = $ubuntuzilla::params::ubuntuzilla_repos,

) inherits ubuntuzilla::params {

  if $::osfamily == 'Debian' {
    include apt
    apt::source { 'ubuntuzilla':
      include_src => $ubuntuzilla_include_src,
      key         => $ubuntuzilla_key,
      key_server  => $ubuntuzilla_key_server,
      location    => $ubuntuzilla_location,
      release     => $ubuntuzilla_release,
      repos       => $ubuntuzilla_repos,
    }
  }

  else {
    notice ("Your operating system ${::operatingsystem} will not have the Ubuntuzilla repository applied")
  }
}