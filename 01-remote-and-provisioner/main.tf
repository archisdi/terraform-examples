provider "aws" {
    region = "us-west-2"
    access_key = var.access_key
    secret_key = var.secret_key
}


resource "local_file" "pet" {
  filename        = "./pet.txt"
  content         = "i have a pet"
  file_permission = "0700"
}