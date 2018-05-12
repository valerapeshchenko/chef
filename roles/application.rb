name "application"
description "The base role for systems that installs JBoss Server and deploy wars"
run_list "recipe[jboss5]"
env_run_lists "Chef-dev" => ["recipe[jboss5]"], "_default" => ["recipe[jboss5]"]
