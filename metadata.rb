name 'ohai'
maintainer 'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license 'Apache-2.0'
description 'Provides custom resources for installing Ohai hints and plugins'

version '5.3.0'

%w(ubuntu debian centos redhat amazon scientific fedora oracle suse opensuse opensuseleap freebsd windows zlinux).each do |os|
  supports os
end

source_url 'https://github.com/chef-cookbooks/ohai'
issues_url 'https://github.com/chef-cookbooks/ohai/issues'
chef_version '>= 13'
