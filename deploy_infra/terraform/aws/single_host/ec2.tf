data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "main" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key.key_name
  vpc_security_group_ids      = [aws_security_group.allow_all.id]
  subnet_id                   = aws_subnet.subnet.id
  associate_public_ip_address = true
}

resource "null_resource" "is_server_ready_check" { # ensure that SSH is ready and accepting connections, that cloud-init has finished and that no apt process is running.
  connection {
    type        = "ssh"
    user        = var.ssh_user
    host        = aws_instance.main.public_ip
    private_key = file("${var.ssh_folder}/${var.ssh_key_name}")
  }

  provisioner "remote-exec" {
    inline = ["echo 'Hello world!'"]
  }

  provisioner "local-exec" {
    command = "while ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o LogLevel=ERROR ${var.ssh_user}@${aws_instance.main.public_ip} -i ${var.ssh_folder}/${var.ssh_key_name} 'ps aux | grep cloud-init | grep -v grep > /dev/null'; do echo 'Waiting for cloud-init to complete...'; sleep 10; done"
  }

  provisioner "local-exec" {
    command = "while ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o LogLevel=ERROR ${var.ssh_user}@${aws_instance.main.public_ip} -i ${var.ssh_folder}/${var.ssh_key_name} 'ps aux | grep apt-get | grep -v grep > /dev/null'; do echo 'Waiting for apt-get to complete...'; sleep 10; done"
  }
}
