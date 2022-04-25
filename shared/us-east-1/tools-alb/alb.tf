module "alb" {
  source = "github.com/binbashar/terraform-aws-alb?ref=v6.10.0"

  name = var.name

  load_balancer_type = "application"

  vpc_id             = var.vpc_id
  subnets            = var.subnet_id
  security_groups    = [module.alb_sg.security_group_id]
  internal           = true

  # access_logs = {
  #   bucket = module.aws_logs.aws_logs_bucket
  # }

  target_groups = [
    {
      name_prefix      = "ec2-"
      backend_protocol = "HTTPS"
      backend_port     = 443
      target_type      = "instance"
      targets = [
        {
          target_id = data.terraform_remote_state.kibana_instance.outputs.instance_id
          port = 443
        }
      ]
    }
  ]

  https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS"
      ssl_policy        = "ELBSecurityPolicy-FS-1-2-Res-2019-08"
      certificate_arn    = var.certificate_id
      target_group_index = 0
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      action_type = "redirect"
      redirect = {
        port        = "443"
        protocol    = "HTTPS"
        status_code = "HTTP_301"
      }
    }
  ]

  tags = {
    # Environment = local.tags
    Environment = "Test"
  }
}