resource "aws_elb" "my-elb" {
    name = "my-elb"
    availability_zones = ["us-east-1c"]

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

    instances                 = ["${aws_instance.first.id}", "${aws_instance.second.id}"]
    cross_zone_load_balancing = true
    idle_timeout              = 40
    tags = {
        Name = var.elb_name
    }
}