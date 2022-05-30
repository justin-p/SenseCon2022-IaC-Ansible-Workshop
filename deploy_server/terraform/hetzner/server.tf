resource "hcloud_server" "main" {
  name        = local.server_hostname
  image       = "ubuntu-20.04"
  server_type = "cx11"
  location    = "nbg1"
  backups     = false
  ssh_keys    = [hcloud_ssh_key.main.id]
}

resource "null_resource" "is_server_ready_check" { # ensure that SSH is ready and accepting connections, that cloud-init has finished and that no apt process is running.
  connection {
    type        = "ssh"
    user        = var.ssh_user
    host        = hcloud_server.main.ipv4_address 
    private_key = file("${var.ssh_folder}/${var.ssh_key_name}")
  }

  provisioner "remote-exec" {
    inline = ["echo 'Hello world!'"]
  }

  provisioner "local-exec" {
    command = "while ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o LogLevel=ERROR ${var.ssh_user}@${hcloud_server.main.ipv4_address} -i ${var.ssh_folder}/${var.ssh_key_name} 'ps aux | grep cloud-init | grep -v grep > /dev/null'; do echo 'Waiting for cloud-init to complete...'; sleep 10; done"
  }

  provisioner "local-exec" {
    command = "while ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o LogLevel=ERROR ${var.ssh_user}@${hcloud_server.main.ipv4_address} -i ${var.ssh_folder}/${var.ssh_key_name} 'ps aux | grep apt-get | grep -v grep > /dev/null'; do echo 'Waiting for apt-get to complete...'; sleep 10; done"
  }
}
