#
# Cookbook Name:: jboss5
# Recipe:: default
#
# Copyright (C) 2014 Andrew DuFour
#
# All rights reserved - Do Not Redistribute
#

#include_recipe 'apt'
include_recipe 'java'

user node['jboss5']['jboss_user'] do
  comment 'jboss User'
#  home node['jboss5']['jboss_home']
  system true
  shell '/bin/false'
end

group node['jboss5']['jboss_group'] do
  action :create
end

package 'unzip' do
  action :install
end

remote_file '/opt/jboss.zip' do
  source node['jboss5']['dl_url']
  owner node['jboss5']['jboss_user']
  group node['jboss5']['jboss_group']
  show_progress true
  action :create_if_missing
end

bash 'unzip' do
  code <<-EOH
    mkdir -p /opt/jboss 
    unzip /opt/jboss.zip -d /opt 
    cp -r /opt/jboss-5.1.0.GA/* /opt/jboss/ 
    chown -R web:web /opt/jboss
    EOH
  not_if { ::File.exist?("#{node['jboss5']['jboss_home']}/server")}
end

# creating jboss service
systemd_unit 'jboss.service' do
  content <<-EOU
  [Unit]
  Description=Jboss Application Server
  After=network.target
  [Service]
  Type=forking
  User=web
  Group=web
  ExecStart=/bin/bash -c 'nohup /opt/jboss/bin/run.sh -b  192.168.100.20 &'
  ExecStop=/bin/bash -c 'bin/shutdown.sh -s 192.168.100.20 -u admin'
  TimeoutStartSec=300
  TimeoutStopSec=600
  SuccessExitStatus=143
  [Install]
  WantedBy=multi-user.target
  EOU
  action [ :create, :enable, :start]
end

data = data_bag_item('confeg','custom_port')
template '/opt/jboss/server/default/deploy/jbossweb.sar/server.xml' do
  source "server.xml.erb"
#  owner 'jboss'
#  group 'jboss'
  variables( super_port: data['special_port'])
  mode 0644
end

remote_file '/opt/jboss/server/default/deploy/sample.war' do
  source 'https://tomcat.apache.org/tomcat-7.0-doc/appdev/sample/sample.war'
  owner node['jboss5']['jboss_user']
  group node['jboss5']['jboss_group']
  show_progress true
  action :create_if_missing
end
