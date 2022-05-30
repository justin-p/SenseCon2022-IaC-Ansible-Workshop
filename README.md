# SenseCon2022-IaC-Ansible-Workshop

## Setup tokens

### AWS

```
export AWS_ACCESS_KEY_ID="AAABBBCCC"
export AWS_SECRET_ACCESS_KEY="AAABBBCCC"
export AWS_SESSION_TOKEN="AAABBBCCC"
```

### DigitalOcean

```
export DO_PAT="dop_v1_AAABBBCCC"
```

### Hetzner

```
export HCLOUD_TOKEN="AAABBBCCC"
```

## Setup variables

### file `deploy_server/defaults/main.yml`

Change the variables in this file, below is a description of the variables.

`provider` - Your prefered provider. Can be `aws`, `digitalocean` or `hetzner`  

`project_name` - project name. you can leave this on the default, `sensecon2022`  

`sshkey_folder` - your .ssh folder location. Must be full path like `/home/justin/.ssh`  
