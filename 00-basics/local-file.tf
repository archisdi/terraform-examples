# immutable file on the local filesystem,
# it will be recreated every time the configuration is applied

resource "local_file" "pet" {
    filename = "./pet.txt"
    content  = "I have a pet cat"
    file_permission = "0700"
}