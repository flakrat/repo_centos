# Configure repositories for CentOS to point to custom repo

# About
This is a puppet module that manages the CentOS repositories
on CentOS clients.

By default, the module configures the repo files to use
http://mirror.centos.org/centos as the package source. This
can be modified by using the class parameter repourl as shown
in the usage notes below

GPG keys are imported.

The following Repos will be setup and enabled by default:
  * centos-base
  * centos-extras
  * centos-updates

Other repositories that will be setup but disabled
  * centos-contrib
  * centos-cr
  * centos-fasttrack
  * centos-plus
  * centos-scl

## New in 1.0.2
  * Added CentOS Fasttrack repository

## New in 1.0.1
  * Added CentOS 7 GPG key
  * README.md cleanup

## New in 1.0.0
  * Major update to add support for parameterized class, the module is now configurable externally
  * Added new dependency on puppetlabs/stdlib for validate_bool() etc... support
  * Added class parameters so that the module can be configured via ENC or Hiera
  * Added additional repo definition for CentOS SCL
  
## New in 0.1.0
  * Initial release. This module is based on the following puppetlabs module: http://github.com/stahnma/puppet-module-puppetlabs_yum

# Testing
  * This was tested on CentOS 5, 6 and 7 clients
  * Tested using Puppet 3.6.2

# Usage
  * Simple usage:
```
include repo_centos
```
  * Advanced usage:
```
class {'repo_centos':
  repourl       => 'http://myrepo/centos',
  enable_scl    => true,
}
```
  * Alternate usage via hiera YAML:
```
repo_centos::repourl: 'http://myrepo/centos'
repo_centos::enable_scl: true
```
# License
Apache Software License 2.0
