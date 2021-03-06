puppet-ipv4_octet
=================

[![Build Status](https://travis-ci.org/deanwilson/puppet-ipv4_octet.svg?branch=master)](https://travis-ci.org/deanwilson/puppet-ipv4_octet)
[![Puppet Forge](https://img.shields.io/puppetforge/v/deanwilson/ipv4_octet.svg)](https://forge.puppetlabs.com/deanwilson/ipv4_octet)

A small(ish) sample Puppet function to return a given octet from an IP Address

Returns the given octet of an IP Address.

    $first = ipv4_octet('10.11.12.13', 0) # returns 10
    $last  = ipv4_octet('10.11.12.13', 3) # returns 13

This function does not yet allow you to extract subselections - such as [1..3]

It has a dependency on puppetlabs-stdlib to work.

## Installation

You can install this module from [PuppetForge](https://forge.puppet.com/):

    puppet module install deanwilson-ipv4_octet

### License ###

Apache 2.0 - [Dean Wilson](http://www.unixdaemon.net)
