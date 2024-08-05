output "ec2_instances_info" {
  description = "Details of all EC2 instances"
  value = [
    for instance in aws_instance.ec2 : {
      id        = instance.id
      name      = instance.tags["Name"]
      instance_type = instance.instance_type
      public_ip = instance.public_ip
      private_ip = instance.private_ip
      os = lookup({
        "ami-04a81a99f5ec58529" = "Ubuntu"
        "ami-0cdb66d9dacb7e395" = "MacOS"
        "ami-07d9456e59793a7d5" = "Windows"
        "ami-0583d8c7a9c35822c" = "RedHat"
        "ami-00402f0bdf4996822" = "Debian"
      }, instance.ami, "Unknown OS")
    }
  ]
}

output "elbs_info" {
  description = "Details of all ELBs"
  value = [
    for elb in aws_elb.elb : {
      name      = elb.name
      dns_name  = elb.dns_name
      instances = elb.instances
    }
  ]
}

output "s3_buckets_info" {
  description = "Details of all S3 buckets"
  value = [
    for bucket in aws_s3_bucket.bucket : {
      name = bucket.bucket
    }
  ]
}
output "elb-sg" {
  description = "Details of the Security Group"
  value = {
    id   = aws_security_group.elb-sg.id
    name = aws_security_group.elb-sg.name
    ingress_rules = [
      for rule in aws_security_group.elb-sg.ingress : {
        from_port   = rule.from_port
        to_port     = rule.to_port
        protocol    = rule.protocol
        cidr_blocks = rule.cidr_blocks
      }
    ]
    egress_rules = [
      for rule in aws_security_group.elb-sg.egress : {
        from_port   = rule.from_port
        to_port     = rule.to_port
        protocol    = rule.protocol
        cidr_blocks = rule.cidr_blocks
      }
    ]
  }
}