require 'spec_helper'

describe 'ohai_test::default' do
  let(:runner) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04') }
  let(:chef_run) { runner.converge('described_recipe') }

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end
end
