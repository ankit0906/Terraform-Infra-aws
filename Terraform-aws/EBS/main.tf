resource "aws_ebs_volume" "ebsvolume" {
  availability_zone = var.availability_zone
  size = 10
  encrypted = false
  tags = {
    name = "my_ebs_volume"
  }

}