#
# Cookbook:: ohai
# Library:: hint_helpers
#
# Author:: Tim Smith (<tsmith@chef.io>)
#
# Copyright:: 2017, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

module OhaiCookbook
  module HintHelpers
    def ohai_hint_path
      path = ::File.join(::Ohai::Config.ohai.hints_path.first, new_resource.hint_name)
      path << '.json' unless path.end_with?('.json')
      path
    end

    def build_content
      # passing nil to file produces deprecation warnings so pass an empty string
      return nil if new_resource.content.nil? || new_resource.content.empty?
      JSON.pretty_generate(new_resource.content)
    end

    def file_content(path)
      return JSON.parse(::File.read(path))
    rescue JSON::ParserError
      Chef::Log.debug("Could not parse JSON in ohai hint at #{ohai_hint_path}. It's probably an empty hint file")
      return nil
    end
  end
end
