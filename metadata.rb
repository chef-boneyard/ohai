name 'ohai'
maintainer 'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license 'Apache 2.0'
description 'Distributes a directory of custom ohai plugins'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '3.0.0'

recipe 'ohai::default', 'Distributes a directory of custom ohai plugins'

%w(ubuntu debian centos redhat amazon scientific fedora oracle freebsd windows).each do |os|
  supports os
end

source_url 'https://github.com/chef-cookbooks/ohai' if respond_to?(:source_url)
issues_url 'https://github.com/chef-cookbooks/ohai/issues' if respond_to?(:issues_url)
