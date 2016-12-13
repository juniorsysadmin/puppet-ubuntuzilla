class ubuntuzilla (
  $include_src = $ubuntuzilla::params::include_src,
  $key         = $ubuntuzilla::params::key,
  $key_server  = $ubuntuzilla::params::key_server,
  $location    = $ubuntuzilla::params::location,
  $release     = $ubuntuzilla::params::release,
  $repos       = $ubuntuzilla::params::repos,

) inherits ubuntuzilla::params {

  if $::osfamily == 'Debian' {
    include ::apt
    apt::source { 'ubuntuzilla':
      include  => {
        'src' => $include_src,
      },
      key      => {
        'id'     => $key,
        'server' => $key_server,
      },
      location => $location,
      release  => $release,
      repos    => $repos,
    }
  }

  else {
    notice ("Your operating system ${::operatingsystem} will not have the Ubuntuzilla repository applied")
  }
}
