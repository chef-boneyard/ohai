require 'spec_helper'

require_relative '../../../libraries/hint_helpers.rb'

describe OhaiCookbook::HintHelpers do
  let(:helper) do
    Object.new.extend(OhaiCookbook::HintHelpers)
  end
end
