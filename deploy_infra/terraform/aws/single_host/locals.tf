resource "random_pet" "name" {
  length = 2
}

resource "random_string" "name" {
  length  = 6
  special = false
  upper   = false
}

locals {
  server_hostname = "${random_pet.name.id}-${random_string.name.result}"
}
