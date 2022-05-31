output "public_ip_host1" {
  value = hcloud_server.host1.ipv4_address
}

output "ssh_command_host1" {
  value = "ssh ${var.ssh_user}@${hcloud_server.host1.ipv4_address} -i ${var.ssh_folder}/${var.ssh_key_name}"
}

output "server_name_host1" {
  value = local.server_hostname1
}


output "public_ip_host2" {
  value = hcloud_server.host2.ipv4_address
}

output "ssh_command_host2" {
  value = "ssh ${var.ssh_user}@${hcloud_server.host2.ipv4_address} -i ${var.ssh_folder}/${var.ssh_key_name}"
}

output "server_name_host2" {
  value = local.server_hostname2
}
