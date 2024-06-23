module "uk_payroll" {
    source = "../modules/payroll-app"
    app_region = "eu-west-1"
    ami = "ami-0c55b159cbfafe1f0"
}