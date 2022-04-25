#
# ElasticSearch & Kibana: EC2 resources (instance, volumes, security groups, etc)
#
module "ec2_elasticsearch_kibana" {
  source = "github.com/binbashar/terraform-aws-ec2-basic-layout?ref=v0.3.27"
  prefix = var.prefix
  name   = var.name

  aws_ami_os_id          = var.aws_ami_os_id
  aws_ami_os_owner       = var.aws_ami_os_owner
  tag_approved_ami_value = var.tag_approved_ami_value

  instance_type = var.instance_type
  vpc_id        = var.vpc_id

  subnet_id                   = var.subnet_id
  associate_public_ip_address = var.associate_public_ip_address
  key_pair_name               = data.terraform_remote_state.keys.outputs.aws_key_pair_name
  instance_profile            = aws_iam_instance_profile.elasticsearch_kibana.name
  ebs_optimized               = var.ebs_optimized
  monitoring                  = var.monitoring

  root_block_device = [
    {
      volume_type = "gp3"
      volume_size = 20
      encrypted   = true
    },
  ]

  # ElasticSearch Data Volume: /var/lib/elasticsearch
  ebs_block_device = [
    {
      device_name = "/dev/sdf"
      volume_type = "gp3"
      volume_size = 200
      encrypted   = true
    },
  ]

  security_group_rules = [
    {
      from_port   = 22,
      to_port     = 22,
      protocol    = "tcp",
      cidr_blocks = var.ssh_access_cidr
      description = "Allow SSH"
    },
    {
      from_port = 80,
      to_port   = 80,
      protocol  = "tcp",
      cidr_blocks = var.application_access_cidr
      description = "Allow ElasticSearch/Kibana through Nginx"
    },
    {
      from_port = 443,
      to_port   = 443,
      protocol  = "tcp",
      cidr_blocks = var.application_access_cidr
      description = "Allow ElasticSearch/Kibana through Nginx"
    },
  ]

  tags = local.tags
}
