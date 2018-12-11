# rpcbind

#### Table of Contents

1. [Module Description - What the module does and why it is useful](#module-description)
1. [Setup - The basics of getting started with rpcbind](#setup)
    * [What rpcbind affects](#what-rpcbind-affects)
    * [Beginning with rpcbind](#beginning-with-rpcbind)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Module description

The `rpcbind` module ensures that rpcbind is running. This is most often used
in conjunction with NFS.

## Setup

### What rpcbind affects

By default this module ensures that the rpcbind package exists and the service
is running and set to start at boot.

### Beginning with rpcbind

Declare the main `::rpcbind` class.

## Usage

You can manage all interaction with rpcbind through the main `rpcbind` class.
With the default options, the module ensures that rpcbind is running.

### Minimum usage

```puppet
include '::rpcbind'
```

### Parameters to configure class.

Please consult the `REFERENCE.md` file for all parameters.

## Limitations

This module is compatible with the latest releases of Puppet v4, v5 and v6.
Please see `metadata.json` for a list of supported platforms. See `.travis.yml`
for a matrix of tested Ruby and Puppet versions.

Supports the following platforms.

* Debian 8
* Debian 9
* EL 6
* EL 7
* Suse 11
* Suse 12
* Ubuntu 14.04 LTS
* Ubuntu 16.04 LTS
* Ubuntu 18.04 LTS

## Development

See `CONTRIBUTING.md` for information related to the development of this
module.
