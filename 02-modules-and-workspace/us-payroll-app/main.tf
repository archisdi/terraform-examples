module "us_payroll" {
    source = "../modules/payroll-app"
    app_region = "us-west-2"
    ami = "ami-0c55b159cbfafe1f0"
}