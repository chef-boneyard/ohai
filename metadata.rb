name 'ohai'
maintainer 'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license 'Apache 2.0'
description 'Provides custom resources for installing Ohai hints and plugins'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '4.2.2'

%w(ubuntu debian centos redhat amazon scientific fedora oracle opensuse opensuseleap freebsd windows zlinux).each do |os|
  supports os
end

depends 'compat_resource', '>= 12.14'

source_url 'https://github.com/chef-cookbooks/ohai'
issues_url 'https://github.com/chef-cookbooks/ohai/issues'

chef_version '>= 12.1'
