resource "digitalocean_project" "main" {
  name        = local.server_hostname1
  description = "SenseCon"
  purpose     = "Other"
  resources   = [digitalocean_droplet.host1.urn, digitalocean_droplet.host2.urn]
}
