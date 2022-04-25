# module "aws_logs" {
#   source         = "github.com/binbashar/terraform-aws-logs?ref=v11.0.11"
#   s3_bucket_name = "aws-logs-lb"
#   default_allow  = false
#   allow_alb      = true
# }