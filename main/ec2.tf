resource "aws_instance" "ec2" {
  for_each          = { for instance in var.ec2_instances : instance.name => instance }
  ami               = each.value.ami
  instance_type     = each.value.instance_type
  key_name          = aws_key_pair.key_pair.key_name
  security_groups   = ["elb-sg"]
  user_data         = <<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y apache2
    systemctl start apache2
    systemctl enable apache2
    echo "${each.value.html_content}" > /var/www/html/index.html
  EOF

  tags = {
    Name   = each.value.name
    source = "terraform"
  }
}