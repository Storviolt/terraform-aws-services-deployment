resource "aws_elb" "elb" {
  for_each             = { for elb in var.elbs : elb.name => elb }
  name                 = each.value.name
  availability_zones   = var.availability_zones

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    target              = "HTTP:80/"
    interval            = 30
  }

  instances = [for instance in each.value.instances : aws_instance.ec2[instance].id]
  
  cross_zone_load_balancing = true
  idle_timeout              = 40

  tags = {
    Name = each.value.name
  }
}