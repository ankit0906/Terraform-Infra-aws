resource "aws_launch_configuration" "as_conf" {
  image_id      = "ami-00c39f71452c08778"
  instance_type = "t2.micro"
  
  

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "my_asg" {
  name                 = "terraform-asg"
  launch_configuration = aws_launch_configuration.as_conf.name
  min_size             = 1
  desired_capacity     = 2
  max_size             = 4
  vpc_zone_identifier = [ "subnet-034da8e2d5bff47e4"  ,"subnet-033d895cc86956303" ]

  lifecycle {
    create_before_destroy = true
  }
}