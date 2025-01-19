resource "aws_route_table" "myroute" {
  vpc_id = var.vpc_id
  
  
  

  route = []

  tags = {
    Name = "route-table"
  }
}

