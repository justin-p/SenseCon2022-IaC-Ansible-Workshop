resource "aws_key_pair" "key" {
  key_name   = local.tag
  public_key = file("${var.ssh_folder}/${var.ssh_key_name}.pub")
}
