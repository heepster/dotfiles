provider "linode" {
  token = var.linode_token
  version = "~> 1.12"
}

resource "linode_instance" "foobar" {
  label = "outpost"
  image =  "linode/debian10"
  region = "us-west"
  type = "g6-nanode-1"
  authorized_keys = var.instance_authorized_keys
  root_pass = var.instance_password
  private_ip = true
}
