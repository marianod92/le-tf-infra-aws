module "alb_sg" {
  source = "github.com/binbashar/terraform-aws-security-group?ref=v4.9.0"

  name        = "alb-sg"
  description = "Security group for alb access"
  vpc_id      = var.vpc_id

  ingress_cidr_blocks      = var.access_cidr
  ingress_rules            = ["https-443-tcp", "http-80-tcp" ]
	egress_rules        		 = ["all-all"]
}