resource "hcloud_ssh_key" "main" {
  name       = "${local.server_hostname1}-ubuntu"
  public_key = file("${var.ssh_folder}/${var.ssh_key_name}.pub")
}
