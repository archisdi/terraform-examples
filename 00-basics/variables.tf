variable "pet_prefix" {
  description = "The prefix of the pet name"
  type        = list(string)
  default     = ["Tuan", "Puan"]
}

variable "pet_separator" {
  description = "The separator between pet name and random string"
  type        = string
  default     = " "
}

variable "pet_length" {
  description = "The length of the random string"
  type        = number
  default     = 2

}

variable "cat_name" {
  type = string
}

variable "file_content" {
  description = "The content of the file"
  type        = map(string)
  default = {
    pet = "I have a pet"
    cat = "I have a pet cat called Whiskers"
  }
}

variable "fruits" {
  description = "A list of fruits"
  type        = set(string)
  default     = ["apple.txt", "banana.txt", "cherry.txt"]
}

# Set -> is a collection of distinct elements
# List -> is a collection of elements where the order of elements is significant
# Map -> is a collection of elements where each element is a key-value pair
# Object -> is a collection of attributes where each attribute is a key-value pair
# Tuple -> is a collection of elements where the type of each element is known, but the number of elements is not known