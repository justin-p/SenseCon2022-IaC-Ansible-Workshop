resource "digitalocean_ssh_key" "main" {
  name       = "${local.server_hostname}-ubuntu"
  public_key = file("${var.ssh_folder}/${var.ssh_key_name}.pub")
}