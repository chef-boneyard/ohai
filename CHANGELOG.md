# ohai Cookbook CHANGELOG

This file is used to list changes made in each version of the ohai cookbook.

## 5.3.0 (2019-08-29)

- Add code owners file - [@tas50](https://github.com/tas50)
- Cookstyle fixes - [@tas50](https://github.com/tas50)
- Require Chef 13 or later - [@tas50](https://github.com/tas50)
- Remove the long_description metadata - [@tas50](https://github.com/tas50)
- Add the load_single_plugin option to the ohai_plugin resource - [@MarkGibbons](https://github.com/MarkGibbons)
- Update for Chef 15 license agreement and Chef Workstation - [@tas50](https://github.com/tas50)
- Update the platforms we test on in Travis / Test Kitchen - [@tas50](https://github.com/tas50)

## 5.2.5 (2018-09-04)

- Add note that ohai_hint will be removed April 2019 when Chef 13 goes EOL as this resource now ships in Chef 14+

## 5.2.4 (2018-08-28)

- Avoid deprecation warnings in Chef 14.3+ by not loading resources already in Chef

## 5.2.3 (2018-06-08)

- Make sure we properly compare a provided plugin path to the path on disk by stripping trailing slashes from the provided directory
- Don't reload ohai when the plugin exists in a subdirectory of the config's set plugin path

## 5.2.2 (2018-02-15)

- Remove ChefSpec matchers we no longer need since they're auto generated

## 5.2.1 (2018-01-25)

- Switch from a .foodcritic file to an inline comments which resolve Supermarket warnings
- Remove unused helper method

## 5.2.0 (2017-08-17)

- Resolve multiple issues with Windows paths that caused the cookbook to converge on every run or fail
- Move maintainer information to the readme
- Add testing on Chef 12.7 in Travis
- Move helpers to their own modules and add testing framework

## 5.1.0 (2017-05-06)

- Workaround action_class bug by requiring Chef 12.7+

## 5.0.4 (2017-04-25)

- Fix lack of .rb extension when deleting plugins.

## 5.0.3 (2017-04-06)

- Use class_eval again in the custom resource to provide Chef 12.5/12.6 compatibility
- Remove kind_of and use name_property not name_attribute
- Fix failures on Chef 13

## 5.0.2 (2017-03-24)

- Remove class_eval

## 5.0.1 (2017-03-14)

- Test with Delivery Local Mode
- Bump the dependency to 12.7+ due to failures on 12.5-12.6

## 5.0.0 (2017-02-23)

- Require Chef 12.5+ and remove compat_resource dependency

## 4.2.3 (2016-12-02)
- Prevent chef_version metadata from failing runs in Opsworks
- Better explain how to resolve the plugin_path issue
- Add suse as a supported platform
- Require at least compat_resource 12.14.7

## 4.2.2 (2016-09-19)
- Ignore case in plugin path check on Windows

## 4.2.1 (2016-09-08)
- Fix typo in compile warning text
- Depend on the latest compat_resource (12.14)
- Remove Chef 11 compat in the metadata
- Require Chef 12.1 not 12.0
- Define ohai_plugin matcher for Chefspec

## v4.2.0 (2016-07-19)

- Added the ability to specify the source cookbook for the cookbook_file or template used in the ohai_plugin resource.
- Added chef_version to the metadata
- Added testing on openSUSE and switched from Rubocop to Cookstyle

## v4.1.1 (2016-06-16)

- Fixed error in notifies reload for the delete action
- Bump the compat_resource requirement from 12.9+ to 12.10+ to prevent random failures

## v4.1.0 (2016-05-26)

- Added the ability to use templates and pass in variables with the plugin custom resource

## v4.0.2 (2016-05-23)

- Resolve failures on Windows nodes

## v4.0.1 (2016-05-19)

- Added .rb to the name of the plugins so they actually load
- Added testing to ensure the plugins are being loaded in the chef run

## v4.0.0 (2016-05-18)

### BREAKING CHANGE:

The 4.0 release of the Ohai cookbook removes the previous cookbook_file behavior that required forking the cookbook and adding your own plugins. Instead the cookbook ships with a new ohai_plugin custom resource for installing plugins. In addition to this new custom resource the cookbook now requires Chef 12+. See the readme and test recipe for examples. If you require Chef 11 support you'll need to pin to version 3.0 in your environment.

## v3.0.1 (2016-03-14)

- Fixed the Chefspec matchers

## v3.0.0 (2016-03-14)

- Change the default value for `node['ohai']['hints_path']` to use the Ohai config value. This should be the same value in most use cases, but if a custom path is specified in the chef client config this value will get used automatically by the cookbook.
- Removed backwards compatibility with Chefspec < 4.1 in the matchers library
- Fix bad link to the custom Ohai plugin documentation in the readme
- Improve documentation for `node['ohai']['plugin_path']`

## v2.1.0 (2016-01-26)

- Properly handle creating ohai hints without specifying the content. Previously if the content wasn't specified a deprecation notice would be thrown and the file would not be created
- Simplified the test suite and added inspec tests to ensure hints are created, especially if the content is not specified
- Added FreeBSD and Windows as supported platform in the metadata and add them to the Test Kitchen config
- Add Test Kitchen integration tests to Travis CI
- Updated testing Gems to the latest releases in the Gemfile

## v2.0.4 (2015-10-30)

- Resolved deprecation warnings with the Chefspec matchers

## v2.0.3 (2015-10-21)

- Validate the hints before loading them to avoid failures
- Added supported platforms to the metadata
- Updated .gitignore file
- Updated Test Kitchen config for the latest platforms
- Added Chef standard Rubocop config
- Added Travis CI testing
- Added Berksfile
- Updated contributing and testing docs
- Added maintainers.md and maintainers.toml files
- Added Travis and cookbook version badges to the readme
- Expanded the requirements section in the readme and clarify the minimum supported Chef release is 11
- Updated Opscode -> Chef Software
- Added a Rakefile for simplified testing
- Added a Chefignore file
- Resolved Rubocop warnings
- Added source_url and issues_url to the metadata
- Added Chefspec matchers
- Added basic convergence Chefspec test

## v2.0.1 (2014-06-07)

- [COOK-4683] Remove warnings about reopening resource

Please note, this changes the name of a remote_directory resource. It is not expected that anyone would be explicitly notifying this resource but, please review [PR #16](https://github.com/chef-cookbooks/ohai/pull/16/files) for more info.

## v2.0.0 (2014-02-25)

'[COOK-3865] - create lwrp ohai_hint'

## v1.1.12

- Dummy release due to a Community Site upload failure

## v1.1.10

### Bug

- **[COOK-3091](https://tickets.chef.io/browse/COOK-3091)** - Fix checking `Chef::Config[:config_file]`

## v1.1.8

- [COOK-1918] - Ohai cookbook to distribute plugins fails on windows
- [COOK-2096] - Ohai cookbook sets unix-only default path attribute

## v1.1.6

- [COOK-2057] - distribution from another cookbok fails if ohai attributes are loaded after the other cookbook

## v1.1.4

- [COOK-1128] - readme update, Replace reference to deprecated chef cookbook with one to chef-client

## v1.1.2

- [COOK-1424] - prevent plugin_path growth to infinity

## v1.1.0

- [COOK-1174] - custom_plugins is only conditionally available
- [COOK-1383] - allow plugins from other cookbooks

## v1.0.2

- [COOK-463] ohai cookbook default recipe should only reload plugins if there were updates
