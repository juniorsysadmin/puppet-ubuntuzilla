class ubuntuzilla (
  $ubuntuzilla_include_src = $ubuntuzilla::params::ubuntuzilla_include_src,
  $ubuntuzilla_key         = $ubuntuzilla::params::ubuntuzilla_key,
  $ubuntuzilla_key_server  = $ubuntuzilla::params::ubuntuzilla_key_server,
  $ubuntuzilla_location    = $ubuntuzilla::params::ubuntuzilla_location,
  $ubuntuzilla_release     = $ubuntuzilla::params::ubuntuzilla_release,
  $ubuntuzilla_repos       = $ubuntuzilla::params::ubuntuzilla_repos,

) inherits ubuntuzilla::params {

  if $::osfamily == 'Debian' {
    include ::apt
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
