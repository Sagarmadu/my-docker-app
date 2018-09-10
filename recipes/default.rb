#
# Cookbook Name:: docker_myapp
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# /tmp/kitchen/cache
path = Chef::Config[:file_cache_path]

cookbook_file "#{path}/Dockerfile" do
  source 'Dockerfile'
end

# cookbook_file "#{path}/sample.war" do
#   source 'sample.war'
# end

cookbook_file "#{path}/loginMysql.war" do
  source 'loginMysql.war'
end

cookbook_file "#{path}/data.sql" do
  source 'data.sql'
end

cookbook_file "#{path}/mysql_import_schema.sh" do
  source 'mysql_import_schema.sh'
  mode 0755
end

docker_service 'default' do
  action [:create, :start]
end

img = 'test_app_mysql'
tag_name = 'v0.1.0'

docker_image img do
  tag tag_name
  source "#{path}"
  action :build
end

docker_container 'myappsql1' do
  repo img
  tag tag_name
  port '8080:8080'
  #host_name 'www'
  #domain_name 'myappsrtc.com'
  action :run
end
