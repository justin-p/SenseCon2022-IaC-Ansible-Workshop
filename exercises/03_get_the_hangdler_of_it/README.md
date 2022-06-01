1. Copy `playbook.yml` from the prevoius excersise and call it `main.yml`.
2. Use a handler to restart nginx when:
   1.  The `default.vhost` file is changed by ansible
   2.  The `sites-*/default` files are removed by ansbile.
3. Create the following variables in a variable file called `vars.yml` and use these variables instead of hardcoded values within the playbook:
   1. `nginx_webroot_path`
   2. `nginx_config_path`
   3. `nginx_sites_enabled` (**hint**: `"{{ nginx_config_path }}/sites-enabled"`)
   4. `nginx_sites_available` (**hint**: `"{{ nginx_config_path }}/sites-available"`)
