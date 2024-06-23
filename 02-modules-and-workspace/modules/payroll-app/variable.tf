
variable "ami" {
    description = "The AMI to use for the instance"
    type = string
}

variable app_region {
    description = "The region to deploy the app server"
    type = string
}

variable bucket {
    description = "The name of the bucket"
    type = string
    default = "flexit-payroll-alpha-22001c"
}