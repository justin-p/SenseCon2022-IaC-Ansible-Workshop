output "public_ip" {
  value = hcloud_server.main.ipv4_address
}

output "ssh_command" {
  value = "ssh ${var.ssh_user}@${hcloud_server.main.ipv4_address} -i ${var.ssh_folder}/${var.ssh_key_name}"
}

output "server_name" {
  value = local.server_hostname
}
