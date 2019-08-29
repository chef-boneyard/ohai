hint_path = case os[:family]
            when 'windows'
              'C:/chef/ohai/hints'
            else
              '/etc/chef/ohai/hints'
            end

describe file("#{hint_path}/hint_at_compile_time.json") do
  it { should be_file }
end

describe file("#{hint_path}/hint_with_content.json") do
  it { should be_file }
end

describe file("#{hint_path}/hint_without_content.json") do
  it { should be_file }
end

describe file("#{hint_path}/hint_with_json_in_resource_name.json") do
  it { should be_file }
end

# we created this file if ohai data from a loaded plugin existed
describe file('/expected_file') do
  it { should be_file }
end

# Shows that running with load_single_plugin does not reload all of the plugins
describe file('/status') do
  its(:content) { should match /Updated by tester1 load/ }
end

describe file('/status2') do
  its(:content) { should match /status\"=>\"Second/ }
end

describe file('/status3') do
  its(:content) { should match /status\"=>\"Second/ }
end
