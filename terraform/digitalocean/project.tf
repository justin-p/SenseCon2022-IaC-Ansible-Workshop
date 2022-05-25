resource "digitalocean_project" "main" {
  name        = local.server_hostname
  description = "SenseCon"
  purpose     = "Other"
  resources   = [digitalocean_droplet.main.urn]
}