output "public_ip_host1" {
  value = aws_instance.host1.public_ip
}

output "public_ip_host2" {
  value = aws_instance.host2.public_ip
}

output "ssh_command_host1" {
  value = "ssh ${var.ssh_user}@${aws_instance.host1.public_ip} -i ${var.ssh_folder}/${var.ssh_key_name}"
}

output "ssh_command_host2" {
  value = "ssh ${var.ssh_user}@${aws_instance.host2.public_ip} -i ${var.ssh_folder}/${var.ssh_key_name}"
}

output "server_name1" {
  value = local.server_hostname1
}

output "server_name2" {
  value = local.server_hostname2
}
