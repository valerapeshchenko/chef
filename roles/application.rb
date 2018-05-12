name "application"
description "for app servers"
run_list "recipe[jboss5]"
env_run_lists "Chef-dev" => ["recipe[jboss5]"], "_default" => ["recipe[jboss5]"]
