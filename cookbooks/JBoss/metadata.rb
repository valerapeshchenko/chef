name 'jboss5'
issues_url 'https://github.com/valerapeshchenko/chef/tree/master/cookbooks'
source_url 'https://github.com/valerapeshchenko/chef/tree/master/cookbooks'
chef_version '4.4.4.4'
maintainer 'Valery Peshchanka'
maintainer_email 'Valery_Peshchanka@epam.com'
license 'All rights reserved'
description 'Installs/Configures jboss5'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.0.0'

depends 'java'

supports 'centos', '>= 6.0'
