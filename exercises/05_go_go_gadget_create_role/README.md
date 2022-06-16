1. Create a role for https://github.com/sensepost/godoh
    1. Ensure the role can either install from source or already build releases from github. Make this behavoir user controlable with a variable.
    2. Ensure that when build from source unique encryption keys are generated.
    3. Ensure that each time the role is ran older builds of godoh are removed.
    4. Template as much as posiable, for example:
       1. Install directory
       2. version to install
       3. repo url to clone/download from
       4. release url to download from & sha1sum
2. Create a playbook that does the following
   1. Bootstrap a host
   2. Install golang
   3. Install godoh

Hint 1. [ansible.builtin.get_url](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/get_url_module.html)

Hint 2. [buildtools role](https://github.com/robertdebock/ansible-role-buildtools)

Hint 3. [golang role](https://github.com/gantsign/ansible-role-golang)

Hint 4. [ansible.builtin.make](https://docs.ansible.com/ansible/2.9/modules/make_module.html)

Hint 5. [Remote environment](https://docs.ansible.com/ansible/latest/user_guide/playbooks_environment.html)

```ansible
  - name: some tasks
    ansible.builtin.some_module:
      a: a
    environment:
      PATH: "{{ ansible_env.PATH }}:{{ add_this_to_the_path_of_this_task }}"
```
