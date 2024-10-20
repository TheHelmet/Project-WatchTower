# metadata

variable "project" {
  type    = string
  default = "WatchTower"
}

# provider information

variable "key_pair" {
  type    = string
  default = "helmet-keypair"
}

# network information

variable "my_ip" {
  type    = string
  default = SECRETS.MY_IP
}
