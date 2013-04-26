require 'spec_helper'

describe 'ipv4_octet' do

  # Basic functionality tests
  #################################################
  it 'Should return the first octet' do
    should run.with_params( '1.2.3.4', 0 ).and_return( 1 )
  end

  it 'Should return the last octet' do
    should run.with_params( '1.2.3.4', 3 ).and_return( 4 )
  end

  it 'Should return the last octet when invoked with a negative index' do
    should run.with_params( '1.2.3.4', -1 ).and_return( 4 )
  end

  # Invalid function call tests
  #################################################
  it 'Should throw an ArgumentError unless called with 2 arguments' do
    expect { subject.call( [ 'a', '2', '3' ] ) }.to raise_error(ArgumentError)
  end

  it 'Should throw an ArgumentError if you access an index beyond 3' do
    expect { subject.call( [ '1.2.3.4', 5 ]) }.to raise_error(ArgumentError)
  end

  it 'Should throw an ArgumentError with an invalid ip address#numeric' do
    expect { subject.call( [ '300.2.3.4', 2 ]) }.to raise_error(ArgumentError)
  end

  it 'Should throw an ArgumentError with an invalid ip address#octets' do
    expect { subject.call( [ '1.2.3.4.5', 2 ]) }.to raise_error(ArgumentError)
  end

end
