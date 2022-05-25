output "public_ip" {
  value = aws_instance.main.public_ip
}

output "ssh_command" {
  value = "ssh ubuntu@${aws_instance.main.public_ip} -i ${local_file.key.filename}"
}