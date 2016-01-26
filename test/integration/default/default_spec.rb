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
