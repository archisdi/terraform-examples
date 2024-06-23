variable "ami" {
  default = {
    "projectA" = "ami-123456",
    "projectB" = "ami-654321"
  }
}

variable instance_type {
    type = string
    default = "t2.micro"
}

variable "region" {
  type = string
  default = "us-west-2"
}