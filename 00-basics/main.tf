# immutable file on the local filesystem,
# it will be recreated every time the configuration is applied

terraform {
    required_providers { // This block is used to define the required providers for the configuration.
        local = {
        source = "hashicorp/local"
        version = "~> 2.5.1"
        }
    }
    
}

resource "local_file" "pet" {
  filename        = "./pet.txt"
  content         = "${var.file_content["pet"]} ${random_pet.pet.id}"
  file_permission = "0700"
  depends_on = [ # This is a list of resources that this resource depends on, optionally, before running.
    random_pet.pet
  ]
#   lifecycle { // This block is used to configure the behavior of the resource during its lifecycle.
#     create_before_destroy = true
#   }
}

resource "local_file" "cat" {
    filename        = "./cat.txt"
    content         = "I have a pet cat called ${var.cat_name}"
    # content         = data.local_file.dog.content // This is an example of using the content attribute of a data source as the content attribute of a resource.
    file_permission = "0700"
    count = 3
#   lifecycle { // This block is used to configure the behavior of the resource during its lifecycle.
#     prevent_destroy = true
#   }
}

resource "random_pet" "pet" {
  length    = var.pet_length
  prefix    = var.pet_prefix[0]
  separator = var.pet_separator
#   lifecycle {
#     ignore_changes = [ // This block is used to ignore changes to specific attributes of the resource.
#       separator
#     ]
#   }
}

# resource "local_file" "fruits" {
#     filename = var.fruits[count.index]
#     content  = "This is a ${var.fruits[count.index]}"
#     count = length(var.fruits)
# }

resource "local_file" "fruits" {
    for_each = var.fruits
    filename = each.value
    content  = "This is a ${each.value}"
  
}

data "local_file" "dog" {
  filename = "./dog.txt"
}

output "pet-name" {
  value       = random_pet.pet.id
  description = "The name of the pet"
}