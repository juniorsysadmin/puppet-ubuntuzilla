# ubuntuzilla

#### Table of Contents

1. [Overview](#overview)
1. [Usage](#usage)
1. [Limitations](#limitations)
1. [Development](#development)

## Overview

This module installs and enables the Ubuntuzilla deb repository.
When run on a non-Debian osfamily it exits with no action performed.

[![Build
Status](https://secure.travis-ci.org/juniorsysadmin/puppet-ubuntuzilla.png)](http://travis-ci.org/juniorsysadmin/puppet-ubuntuzilla)

## Usage

```puppet
include  '::ubuntuzilla'
```

or to use your own Ubuntuzilla mirror:

```puppet
class { '::ubuntuzilla':
  key        => 'A1234567',
  key_server => 'keyserver.server.com',
  location   => 'ubuntuzilla.mirror.com',
}
```

### Parameters

The following parameters are available in the ubuntuzilla module:

#### `include_src`

Used by apt::source. Defaults to false.

#### `key`

Used by apt::source. Defaults to the official Ubuntuzilla one.

#### `key_server`

Used by apt::source. Defaults to keyserver.ubuntu.com

#### `location`

Location of Ubuntuzilla repository. Defaults to
http://downloads.sourceforge.net/project/ubuntuzilla/mozilla/apt

#### `release`

Used by apt::source. Defaults to all.

#### `repos`

Used by apt::source. Defaults to main.

## Limitations

This module has received limited testing on:

* Debian 6/7
* Ubuntu 10.04/12.04/14.04

against Puppet 3.8.7 and Puppet 4.x

## Development

Patches are welcome.
