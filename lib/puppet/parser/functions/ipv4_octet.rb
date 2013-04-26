module Puppet::Parser::Functions
  newfunction(:ipv4_octet, :type => :rvalue, :arity => 2, :doc => 
    "Returns the given octet of an IP Address.

        $first = ipv4_octet('10.11.12.13', 0) # returns 10
        $last  = ipv4_octet('10.11.12.13', 3) # returns 13

     This function does not yet allow you to extract subselections - such as [1..3]   
             ") do |args|
    raise ArgumentError, ("ipv4_octet(): wrong number of arguments (#{args.length} must be 2)") if args.length != 2

    ipaddress = args[0]
    index     = args[1].to_i

    # load in the ip validation function from puppetlabs-stdlib
    unless Puppet::Parser::Functions.function('is_ip_address')
      raise Puppet::ParseError, "ipv4_octet(): requires the puppetlabs-stdlib functions"
    end

    unless function_is_ip_address( [ ipaddress ] )
      raise ArgumentError, "ipv4_octet(): [#{ipaddress}] is an invalid ip address"
    end

    allowed_index = [ 0, 1, 2, 3, -1 ]
    unless allowed_index.include? index
      raise ArgumentError, "ipv4_octet(): index must be one of #{allowed_index.join(',')}"
    end
    
    ipaddress.split('.')[index].to_i
  end
end
