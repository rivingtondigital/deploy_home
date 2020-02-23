# variables.tf

variable "cidr_block"{}
variable "region"{}
variable "zone"{}

variable "public_ip" {
  description = "map instances to public addresses"
  default = false
}


