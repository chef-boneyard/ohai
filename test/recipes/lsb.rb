# # encoding: utf-8

# Inspec test for recipe ohai::lsb

describe command('/usr/bin/lsb_release') do
  it { should exist }
end
