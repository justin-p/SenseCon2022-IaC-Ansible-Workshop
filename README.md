# SenseCon2022-IaC-Ansible-Workshop

# TODO

1. Gen ssh key outside of terraform using ansible
   1. Update AWS and DO templates
2. Add Hetzner template

## AWS

```
export AWS_ACCESS_KEY_ID="AAABBBCCC"
export AWS_SECRET_ACCESS_KEY="AAABBBCCC"
export AWS_SESSION_TOKEN="AAABBBCCC"
terraform init
terraform apply
```

## DO

```
export DO_PAT="dop_v1_AAABBBCCC"
terraform init
terraform apply -var "do_token=${DO_PAT}"
```