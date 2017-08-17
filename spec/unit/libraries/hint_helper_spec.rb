require 'spec_helper'

require_relative '../../../libraries/hint_helpers.rb'

describe OhaiCookbook::HintHelpers do
  let(:helper) do
    Object.new.extend(OhaiCookbook::HintHelpers)
  end

  describe '#ohai_hint_file_path' do
    it 'returns a full path given a hint name' do
      ::Ohai::Config.ohai.hints_path = ['/foo/bar/ohai/hints/']
      expect(helper.ohai_hint_file_path('mycloud')).to eq('/foo/bar/ohai/hints/mycloud.json')
    end

    it 'handles hint names that end in .json' do
      ::Ohai::Config.ohai.hints_path = ['/foo/bar/ohai/hints/']
      expect(helper.ohai_hint_file_path('mycloud.json')).to eq('/foo/bar/ohai/hints/mycloud.json')
    end
  end

  describe '#format_content' do
    it 'returns JSON given a simple hash' do
      expect(helper.format_content(foo: 'bar')).to eq("{\n  \"foo\": \"bar\"\n}")
    end

    it 'returns empty string if content is nil to avoid deprecation warnings' do
      expect(helper.format_content(nil)).to eq('')
    end

    it 'returns empty string if content is empty hash' do
      expect(helper.format_content({})).to eq('')
    end
  end
end
