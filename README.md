####Table of Contents

1. [Overview](#overview)
2. [Usage - Configuration options](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

##Overview

This module installs and enables the Ubuntuzilla deb repository.
When run on a non-Debian osfamily it exits. 

[![Build
Status](https://secure.travis-ci.org/juniorsysadmin/juniorsysadmin-puppet-ubuntuzilla.png)](http://travis-ci.org/juniorsysadmin/juniorsysadmin-puppet-ubuntuzilla)

##Usage

`include  ubuntuzilla` or to use your own Ubuntuzilla mirror:

```puppet
class { '::ubuntuzilla':
  ubuntuzilla_key => 'A2CG4CE',
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
