
module "security-group_ssh" {
    source  = "terraform-aws-modules/security-group/aws//modules/ssh"
    version = "5.1.2"
    vpc_id = "vpc-12345678"
    name = "ssh-access"
    ingress_cidr_blocks = ["10.10.0.0/16"]
}