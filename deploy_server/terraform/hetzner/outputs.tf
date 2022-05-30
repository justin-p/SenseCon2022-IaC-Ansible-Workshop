output "public_ip" {
  value = aws_instance.main.public_ip
}

output "ssh_command" {
  value = "ssh ${var.ssh_user}@${aws_instance.main.public_ip} -i ${var.ssh_folder}/${var.ssh_key_name}"
}
