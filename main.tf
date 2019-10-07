

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

resource "aws_autoscaling_group" "bar" {
  name                 = "pizzaweb-ag"
  launch_configuration = "${aws_launch_configuration.as_conf.name}"
  min_size             = 2
  max_size             = 2
  vpc_zone_identifier       = ["subnet-001852ce35980683c", "subnet-0e9a8efcdbdfe404a"]

  lifecycle {
    create_before_destroy = true
  }
}