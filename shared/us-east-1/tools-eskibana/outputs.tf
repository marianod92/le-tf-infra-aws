output "instance_private_ip" {
  description = "EC2 private ip address"
  value       = module.ec2_elasticsearch_kibana.aws_instance_private_ip
}

output "instance_id" {
  description = "EC2 instance id"
  value       = module.ec2_elasticsearch_kibana.instance.id
}