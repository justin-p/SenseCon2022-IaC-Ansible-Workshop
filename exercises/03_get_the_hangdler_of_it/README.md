1. Copy `playbook.yml` from the previous excersise and call it `main.yml`.
2. Use a handler to restart nginx when:
   - The `default.vhost` file is changed by ansible.
   - The `sites-*/default` files are removed by ansbile.
3. Create the following variables in a variable file called `./vars/main.yaml`. Create the following variables to replace hardcoded values within the playbook:
   - `nginx_webroot_path`
   - `nginx_config_path`
   - `nginx_sites_enabled` (**hint**: `"{{ nginx_config_path }}/sites-enabled"`)
   - `nginx_sites_available` (**hint**: `"{{ nginx_config_path }}/sites-available"`)
4. Deploy the `./templates/default.vhost.j2` Jinja template instead of the `/files/default.vhost` file.
   - Ensure that it's clear that this file is managed by ansible.
   - Ensure that whenever someone changes the `nginx_webroot_path` this is also reflected in the template. (**hint**: `root /var/www/html;`)
5. Ensure whenever someone updates the `nginx_webroot_path` this folder exists before files are copied into this folder. (**hint**: `state: directory`)
6. Ensure that if someone wants to use a custom vhost template they can do so by updating a variable in `vars.yml`
7. Ensure that the playbook is idempotent.
