# immutable file on the local filesystem,
# it will be recreated every time the configuration is applied

resource "local_file" "pet" {
    filename = "./pet.txt"
    content  = "${var.file_content["pet"]} ${random_pet.pet.id}"
    file_permission = "0700"
    depends_on = [ # This is a list of resources that this resource depends on, optionally, before running.
        random_pet.pet
    ]
}

resource "local_file" "cat" {
    filename = "./cat.txt"
    content  = "I have a pet cat called ${var.cat_name}"
    file_permission = "0700"
}

resource "random_pet" "pet" {
    length = var.pet_length
    prefix = var.pet_prefix[0]
    separator = var.pet_separator
}

output pet-name {
    value = "${random_pet.pet.id}"
    description = "The name of the pet"
}