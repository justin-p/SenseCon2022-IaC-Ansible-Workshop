output "public_ip" {
  value = digitalocean_droplet.main.ipv4_address
}

output "ssh_command" {
  value = "ssh ${var.ssh_user}@${digitalocean_droplet.main.ipv4_address} -i ${var.ssh_folder}/${var.ssh_key_name}"
}
