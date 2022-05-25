resource "digitalocean_vpc" "main" {
  name   = "vpc-${local.server_hostname}"
  region = "ams3"
}

resource "digitalocean_droplet" "main" {
  name          = local.server_hostname
  image         = "ubuntu-20-04-x64"
  size          = "s-1vcpu-1gb"
  region        = "ams3"
  monitoring    = "false"
  droplet_agent = "false"
  ssh_keys      = [digitalocean_ssh_key.main.id]
  vpc_uuid      = digitalocean_vpc.main.id
}

resource "null_resource" "is_server_ready_check" { # ensure that SSH is ready and accepting connections, that cloud-init has finished and that no apt process is running.
  connection {
    type        = "ssh"
    user        = "ubuntu"
    host        = digitalocean_droplet.main.ipv4_address
    private_key = file("${local_file.private_key.filename}")
  }

  provisioner "remote-exec" {
    inline = ["echo 'Hello world!'"]
  }

  provisioner "local-exec" {
    command = "while ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o LogLevel=ERROR ubuntu@${digitalocean_droplet.main.ipv4_address} -i ${local_file.private_key.filename} 'ps aux | grep cloud-init | grep -v grep > /dev/null'; do echo 'Waiting for cloud-init to complete...'; sleep 10; done"
  }

  provisioner "local-exec" {
    command = "while ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o LogLevel=ERROR ubuntu@${digitalocean_droplet.main.ipv4_address} -i ${local_file.private_key.filename} 'ps aux | grep apt-get | grep -v grep > /dev/null'; do echo 'Waiting for apt-get to complete...'; sleep 10; done"
  }
}
