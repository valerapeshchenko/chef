#
# Cookbook:: jboss7
# Spec:: defaultt
#
# Aleh Yarmalovich
# MTN Lab spr 2018.

require 'chefspec'
require 'chefspec/berkshelf'

describe 'jboss5::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'centos', version: '7.4.1708') do |node|
      node.override['jboss5']['public_bind_addr'] = '192.168.100.20'
    end.converge(described_recipe)
  end

  before do
    stub_data_bag_item("confeg", "custom_port").and_return("id": "http", "http_port": "8314")
  end

  it 'Create a template "standalone.xml" with attributes' do
    expect(chef_run).to create_template('/opt/jboss/server/default/deploy/jbossweb.sar/server.xml').with(
      source: 'server.xml.erb',
    #  user: 'web',
   #   group: 'web',
    )
  end
  
  it 'Creates user' do
    expect(chef_run).to create_user('web')
  end

end
