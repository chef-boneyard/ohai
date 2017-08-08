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
  end

  describe('#chef_config_path') do
  end
end
