module Puppet
  module Parser
    module Functions
      newfunction(:ipv4_octet, type: :rvalue, arity: 2, doc: <<-EOD
        Returns the given octet of an IP Address.

          $first = ipv4_octet('10.11.12.13', 0) # returns 10
          $last  = ipv4_octet('10.11.12.13', 3) # returns 13

        This function does not yet allow you to extract subselections - such as [1..3]
      EOD
      ) do |args|
        unless args.length == 2
          fail ArgumentError, "ipv4_octet(): wrong number of arguments (#{args.length} must be 2)"
        end

        ipaddress = args[0]
        index     = args[1].to_i

        # load in the ip validation function from puppetlabs-stdlib
        unless Puppet::Parser::Functions.function('is_ip_address')
          fail Puppet::ParseError, 'ipv4_octet(): requires the puppetlabs-stdlib functions'
        end

        unless function_is_ip_address([ipaddress])
          fail ArgumentError, "ipv4_octet(): [#{ipaddress}] is an invalid ip address"
        end

        allowed_index = [0, 1, 2, 3, -1]
        unless allowed_index.include? index
          fail ArgumentError, "ipv4_octet(): index must be one of #{allowed_index.join(',')}"
        end

        ipaddress.split('.')[index].to_i
      end
    end
  end
end
