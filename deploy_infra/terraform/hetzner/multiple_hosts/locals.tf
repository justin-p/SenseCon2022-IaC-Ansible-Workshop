resource "random_pet" "name1" {
  length = 2
}

resource "random_string" "name1" {
  length  = 6
  special = false
  upper   = false
}

resource "random_pet" "name2" {
  length = 2
}

resource "random_string" "name2" {
  length  = 6
  special = false
  upper   = false
}

locals {
  server_hostname1 = "${random_pet.name1.id}-${random_string.name1.result}"
  server_hostname2 = "${random_pet.name2.id}-${random_string.name2.result}"
}
