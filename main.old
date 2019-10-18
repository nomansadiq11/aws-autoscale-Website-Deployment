

# data "aws_ami" "ubuntu" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["099720109477"] # Canonical
# }

# ${data.aws_ami.ubuntu.id}

resource "aws_launch_configuration" "as_conf" {
  name_prefix   = "pizzaweb-lc"
  image_id      = "ami-0b69ea66ff7391e80"
  instance_type = "t2.micro"

  lifecycle {
    create_before_destroy = true
  }
}

## Security Group for ELB
resource "aws_security_group" "elb" {
  name = "terraform-example-elb"
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

### Creating ELB
resource "aws_elb" "example" {
  name = "terraform-asg-example"
  security_groups = ["${aws_security_group.elb.id}"]
  availability_zones = ["subnet-001852ce35980683c", "subnet-0e9a8efcdbdfe404a"]
  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    interval = 30
    target = "HTTP:8080/"
  }
  listener {
    lb_port = 80
    lb_protocol = "http"
    instance_port = "8080"
    instance_protocol = "http"
  }
}

resource "aws_autoscaling_group" "bar" {
  name                 = "pizzaweb-ag"
  launch_configuration = "${aws_launch_configuration.as_conf.name}"
  min_size             = "${var.Count}"
  max_size             = 2
  load_balancers = ["${aws_elb.example.name}"]
  # vpc_zone_identifier       = ["subnet-001852ce35980683c", "subnet-0e9a8efcdbdfe404a"]
 

  
}