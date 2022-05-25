resource "tls_private_key" "key" {
  algorithm = "ED25519"
}

resource "aws_key_pair" "key" {
  key_name   = local.tag
  public_key = tls_private_key.key.public_key_openssh
}

resource "local_file" "private_key" {
  content         = tls_private_key.key.private_key_openssh
  filename        = "../../${local.tag}.key"
  file_permission = "0600"
}

resource "local_file" "public_key" {
  content         = tls_private_key.key.public_key_openssh
  filename        = "../../${local.tag}.pub"
  file_permission = "0600"
}