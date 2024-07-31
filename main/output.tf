output "ec2_instance_first" {
  description = "Details of the first EC2 instance"
  value = {
    ami        = aws_instance.first.ami
    name       = aws_instance.first.tags["Name"]
    public_ip  = aws_instance.first.public_ip
    os         = lookup({
      "ami-04a81a99f5ec58529" = "Ubuntu"
      "ami-0cdb66d9dacb7e395" = "MacOS"
      "ami-07d9456e59793a7d5" = "Windows"
      "ami-0583d8c7a9c35822c" = "RedHat"
      "ami-00402f0bdf4996822" = "Debian"
    }, aws_instance.first.ami, "Unknown OS")
    id         = aws_instance.first.id
  }
}

output "ec2_instance_second" {
  description = "Details of the second EC2 instance"
  value = {
    ami        = aws_instance.second.ami
    name       = aws_instance.second.tags["Name"]
    public_ip  = aws_instance.second.public_ip
    os         = lookup({
      "ami-04a81a99f5ec58529" = "Ubuntu"
      "ami-0cdb66d9dacb7e395" = "MacOS"
      "ami-07d9456e59793a7d5" = "Windows"
      "ami-0583d8c7a9c35822c" = "RedHat"
      "ami-00402f0bdf4996822" = "Debian"
    }, aws_instance.second.ami, "Unknown OS")
    id         = aws_instance.second.id
  }
}

output "elastic_load_balancer" {
  description = "Details of the Elastic Load Balancer"
  value = {
    name      = aws_elb.my-elb.name
    instances = aws_elb.my-elb.instances
  }
}

output "s3_bucket" {
  description = "Details of the S3 bucket and object"
  value = {
    bucket_name = aws_s3_bucket.mybucket.bucket
    object_key  = aws_s3_object.myfile.key
  }
}

output "security_group" {
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