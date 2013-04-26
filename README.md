puppet-ipv4_octet
=================

A small(ish) sample Puppet function to return a given octet from an IP Address

Returns the given octet of an IP Address.

    $first = ipv4_octet('10.11.12.13', 0) # returns 10
    $last  = ipv4_octet('10.11.12.13', 3) # returns 13

This function does not yet allow you to extract subselections - such as [1..3]   
