require 'spec_helper'

require_relative '../../../libraries/plugin_helpers.rb'

describe OhaiCookbook::PluginHelpers do
  let(:helper) do
    Object.new.extend(OhaiCookbook::PluginHelpers)
  end

  describe('#normalize_path') do
    it 'does nothing to a unix path' do
      expect(helper.normalize_path('/foo/bar/')).to eq('/foo/bar/')
    end

    it 'lowers the case of a forward slash windows path' do
      expect(helper.normalize_path('C:/foo/bar')).to eq('c:/foo/bar')
    end

    it 'converts single backslash to a single forward slash' do
      expect(helper.normalize_path('C:\foo\bar')).to eq('c:/foo/bar')
    end

    it 'converts double backslashes to a single forward slash' do
      expect(helper.normalize_path('C:\\foo\\bar')).to eq('c:/foo/bar')
    end

    it 'converts an insane numbers of backslashes to a single forward slash' do
      expect(helper.normalize_path('C:\\\\\\\foo\\\\\\\\bar')).to eq('c:/foo/bar')
    end
  end

  describe('#in_plugin_path?') do
    it 'returns false if the path is not in the config' do
      ::Ohai::Config.ohai['plugin_path'] = ['/foo/bar']
      expect(helper.in_plugin_path?('/foo/baz/plugin.rb')).to eq(false)
    end

    it 'returns true if the path is in the config' do
      ::Ohai::Config.ohai['plugin_path'] = ['/foo/bar']
      expect(helper.in_plugin_path?('/foo/bar/plugin.rb')).to eq(true)
    end

    it 'returns true if the path is a subdirectory of the path in the config' do
      ::Ohai::Config.ohai['plugin_path'] = ['/foo/bar']
      expect(helper.in_plugin_path?('/foo/bar/baz/plugin.rb')).to eq(true)
    end

    it 'returns true if the path is in the config regardless of format' do
      ::Ohai::Config.ohai['plugin_path'] = ['C:/foo/bar']
      expect(helper.in_plugin_path?('C:\\foo\\bar\\plugin.rb')).to eq(true)
    end
  end

  describe('#chef_config_path') do
    it 'returns a path given the chef-client config file' do
      Chef::Config['config_file'] = '/foo/bar/client.rb'
      expect(helper.chef_config_path).to eq('/foo/bar')
    end
  end
end
