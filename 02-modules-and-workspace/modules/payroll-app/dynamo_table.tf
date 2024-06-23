
resource "aws_dynamodb_table" "payroll_db" {
    name           = "payroll_db"
    billing_mode   = "PAY_PER_REQUEST"
    hash_key       = "id"
    attribute {
        name = "EmployeeID"
        type = "N"
    }
}