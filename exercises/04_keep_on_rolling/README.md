Convert the playbook from the previous exercise to use roles.

1. Use the ansible galaxy 'trick' and bootstrap tasks from the examples.
2. Replace the nginx installation with a nginx role. You can search Ansible-Galaxy/Github for one you would like to use. I would recommend [this one.](https://github.com/nginxinc/ansible-role-nginx). ( **hint** Depending on the role you might need to update some nginx paths.)
3. Split the installation of nginx and the deployment of the webapp to 2 different files and import them using `import_tasks`.
