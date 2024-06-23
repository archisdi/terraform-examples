
# s3 bucket
resource "aws_s3_bucket" "payroll_ap" {
  bucket = "${var.app_region}-${var.bucket}"
}