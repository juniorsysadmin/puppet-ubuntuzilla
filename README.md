####Table of Contents

1. [Overview](#overview)
2. [Usage](#usage)
3. [Limitations](#limitations)
4. [Development](#development)

##Overview

This module installs and enables the Ubuntuzilla deb repository.
When run on a non-Debian osfamily it exits with no action. 

[![Build
Status](https://secure.travis-ci.org/juniorsysadmin/puppet-ubuntuzilla.png)](http://travis-ci.org/juniorsysadmin/puppet-ubuntuzilla)

##Usage

```puppet
include  '::ubuntuzilla'
```

or to use your own Ubuntuzilla mirror:

```puppet
class { '::ubuntuzilla':
  ubuntuzilla_key => 'A1234567',
  ubuntuzilla_key_server => 'keyserver.server.com',
  ubuntuzilla_location => 'ubuntuzilla.mirror.com',
}
```

###Parameters

The following parameters are available in the ubuntuzilla module:

####`ubuntuzilla_include_src`

Used by apt::source. Defaults to false.

####`ubuntuzilla_key`

Used by apt::source. Defaults to the official Ubuntuzilla one.

####`ubuntuzilla_key_server`

Used by apt::source. Defaults to keyserver.ubuntu.com

####`ubuntuzilla_location`

Location of Ubuntuzilla repository. Defaults to
http://downloads.sourceforge.net/project/ubuntuzilla/mozilla/apt

####`ubuntuzilla_release`

Used by apt::source. Defaults to all.

####`ubuntuzilla_repos`

Used by apt::source. Defaults to main.

##Limitations

This module has received limited testing on:

* Debian 6/7
* Ubuntu 10.04/12.04/14.04

against Puppet 2.7.x and 3.x

##Development

Patches are welcome.
