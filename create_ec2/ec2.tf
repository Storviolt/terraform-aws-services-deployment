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
    echo "THIS IS FIRST WEB SERVER" > /var/www/html/index.html
  EOF

  tags = {
    Name   = "First_web_server"
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
    echo "THIS IS SECOND WEB SERVER" > /var/www/html/index.html
  EOF

  tags = {
    Name   = "Second_web_server"
    source = "terraform"
  }
}