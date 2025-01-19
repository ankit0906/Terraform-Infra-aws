resource "aws_nat_gateway" "nat_gate" {
  subnet_id = var.subnet_id
  connectivity_type = "private"

  tags = {
    Name = "gw NAT"
  }

  
}