#
# Cookbook:: web
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# frozen_string_literal: true
require 'chefspec'

describe 'web::default' do
  let(:chef) do
    runner = ChefSpec::ServerRunner.new.converge(described_recipe)
  end

  it 'converges is in a good state' do
    expect { chef }.to_not raise_error
  end

  it 'check, that nginx packages are installed' do
    expect(chef).to install_package 'nginx'
  end

  it 'Ensure that nginx enabled' do
    expect(chef).to_not enable_service('resource')
  end
end
