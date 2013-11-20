require 'spec_helper'

describe file('/etc/chef/ohai/hints/test-kitchen.json') do
  it { should be_file }
  it { should contain "always clean" }
end

describe file('/tmp/node.json') do
  it { should be_file }
  it { should contain "always clean" }
end
