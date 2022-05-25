resource "tls_private_key" "key" {
  algorithm = "ED25519"
}

resource "local_file" "private_key" {
  content         = tls_private_key.key.private_key_openssh
  filename        = "../../${local.server_hostname}.key"
  file_permission = "0600"
}

resource "local_file" "public_key" {
  content         = tls_private_key.key.public_key_openssh
  filename        = "../../${local.server_hostname}.pub"
  file_permission = "0600"
}

resource "digitalocean_ssh_key" "main" {
  name       = "${local.server_hostname}-ubuntu"
  public_key = file("../../${local.server_hostname}.pub")
}