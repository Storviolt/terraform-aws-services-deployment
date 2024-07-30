resource "aws_instance" "first" {
  ami             = "ami-04a81a99f5ec58529"
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.key_pair.key_name
  security_groups = ["elb-sg"]
  user_data = <<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y apache2
    systemctl start apache2
    systemctl enable apache2
    echo "${var.first_instance_html_content}" > /var/www/html/index.html
  EOF

  tags = {
    Name   = var.first_instance_name
    source = "terraform"
  }
}

resource "aws_instance" "second" {
  ami             = "ami-04a81a99f5ec58529"
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.key_pair.key_name
  security_groups = ["elb-sg"]
  user_data = <<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y apache2
    systemctl start apache2
    systemctl enable apache2
    echo "${var.second_instance_html_content}" > /var/www/html/index.html
  EOF

  tags = {
    Name   = var.second_instance_name
    source = "terraform"
  }
}