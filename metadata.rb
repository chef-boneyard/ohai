name 'ohai'
maintainer 'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license 'Apache 2.0'
description 'Distributes a directory of custom ohai plugins'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '2.0.4'

recipe 'ohai::default', 'Distributes a directory of custom ohai plugins'

source_url 'https://github.com/chef-cookbooks/ohai' if respond_to?(:source_url)
issues_url 'https://github.com/chef-cookbooks/ohai/issues' if respond_to?(:issues_url)

%w(ubuntu debian centos redhat amazon scientific fedora oracle freebsd).each do |os|
  supports os
end
