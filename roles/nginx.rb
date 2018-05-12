name "nginx"
description "for super web servers"
run_list "recipe[web]"
env_run_lists "Chef-dev" => ["recipe[web]"], "_default" => ["recipe[web]"]
