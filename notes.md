**There are 3 types of IaC tools**

Configuration Management
    are designed to install and manage software,
    maintaining standard structures,
    version controlled,and are idempotent.
    Examples:
        - Ansible
        - Puppet
        - Salt Stack

Server Templating
    Pre-installed software and dependencies,
    for creating virtual machines or containers,
    are immutable infrastrucfure.
    Examples:
        - Docker
        - Packer
        - Vagrant

Provisioning Tools
    Deploy immutable infrasctructure resources,
    such as servers, databases, network components, etc,
    it has multiple providers.
    Examples:
        - Terraform
        - CloudFormation

**3 Step to provision**
- terraform init
- terraform plan
- terraform apply

**General Notes**
- terraform uses HCL, hashicorp configuration language to define the infrastructure resources as block of codes.
- the configuration file uses .tf
- terraform store the state of real life infrastructure as .tfstate
