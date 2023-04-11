# VPC

resource "aws_vpc" "vpc1" { 
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = {
    "Name"             = var.vpc_name
  }
}

# SUBNETS

resource "aws_subnet" "subnet1" {
  cidr_block           = var.subnet1_cidr_block
  availability_zone    = var.availability_zone1
  vpc_id               = aws_vpc.vpc1.id
  tags = {
    "Name"             = var.subnet1_name
  }
}
resource "aws_subnet" "subnet2" {
  cidr_block          = var.subnet2_cidr_block
  availability_zone   = var.availability_zone2
  vpc_id              = aws_vpc.vpc1.id
  tags = {
    "Name"            = var.subnet2_name
  }
}
resource "aws_subnet" "subnet3" {
  cidr_block           = var.subnet3_cidr_block
  availability_zone    = var.availability_zone1
  vpc_id               = aws_vpc.vpc1.id
  tags = {
    "Name"             = var.subnet3_name
  }
}
resource "aws_subnet" "subnet4" {
  cidr_block          = var.subnet4_cidr_block
  availability_zone   = var.availability_zone1
  vpc_id              = aws_vpc.vpc1.id
  tags = {
    "Name"            = var.subnet4_name
  }
}
resource "aws_subnet" "subnet5" {
  cidr_block           = var.subnet5_cidr_block
  availability_zone    = var.availability_zone1
  vpc_id               = aws_vpc.vpc1.id
  tags = {
    "Name"             = var.subnet5_name
  }
}
resource "aws_subnet" "subnet6" {
  cidr_block          = var.subnet6_cidr_block
  availability_zone   = var.availability_zone2
  vpc_id              = aws_vpc.vpc1.id
  tags = {
    "Name"            = var.subnet6_name
  }
}
resource "aws_subnet" "subnet7" {
  cidr_block           = var.subnet7_cidr_block
  availability_zone    = var.availability_zone2
  vpc_id               = aws_vpc.vpc1.id
  tags = {
    "Name"             = var.subnet7_name
  }
}
resource "aws_subnet" "subnet8" {
  cidr_block          = var.subnet8_cidr_block
  availability_zone   = var.availability_zone2
  vpc_id              = aws_vpc.vpc1.id
  tags = {
    "Name"            = var.subnet8_name
  }
}

# Internet Gateway

resource "aws_internet_gateway" "igw" {
  vpc_id                 = aws_vpc.vpc1.id
  tags = {
    "Name"               = var.igw_name
  }
}

# Elastic IP
resource "aws_eip" "nat_eip1" {    
}
resource "aws_eip" "nat_eip2" {    
}

# NAT Gateway

resource "aws_nat_gateway" "nat1" {
  subnet_id             = aws_subnet.subnet1.id
  allocation_id         = aws_eip.nat_eip1.id
  tags = {
    "Name"              = var.nat_name1
  }
}
resource "aws_nat_gateway" "nat2" {
  subnet_id             = aws_subnet.subnet2.id
  allocation_id         = aws_eip.nat_eip2.id
  tags = {
    "Name"              = var.nat_name2
  }
}

# ROUTE TABLES

resource "aws_route_table" "public_rt1" {
  vpc_id                = aws_vpc.vpc1.id
  route {
    cidr_block          = var.rt_cidr_block
    gateway_id          = aws_internet_gateway.igw.id
  }
  tags = {
    "Name"              = var.rt_name1
  }
}
resource "aws_route_table_association" "RTA1" {
  subnet_id             = aws_subnet.subnet1.id
  route_table_id        = aws_route_table.public_rt1.id
}

resource "aws_route_table" "public_rt2" {
  vpc_id                = aws_vpc.vpc1.id
  route {
    cidr_block          = var.rt_cidr_block
    gateway_id          = aws_internet_gateway.igw.id
  }
  tags = {
    "Name"              = var.rt_name2
  }
}
resource "aws_route_table_association" "RTA2" {
  subnet_id             = aws_subnet.subnet2.id
  route_table_id        = aws_route_table.public_rt2.id
}

resource "aws_route_table" "RT1" {
vpc_id                  = aws_vpc.vpc1.id
route {
    cidr_block          = var.rt_cidr_block
    gateway_id          = aws_nat_gateway.nat1.id
  }
  tags = {
    "Name"              = var.rt_name3
  }
}
resource "aws_route_table_association" "RTA3" {
  subnet_id            = aws_subnet.subnet3.id
  route_table_id       = aws_route_table.RT1.id
}
resource "aws_route_table_association" "RTA4" {
  subnet_id            = aws_subnet.subnet4.id
  route_table_id       = aws_route_table.RT1.id
}
resource "aws_route_table_association" "RTA5" {
  subnet_id            = aws_subnet.subnet5.id
  route_table_id       = aws_route_table.RT1.id
}

resource "aws_route_table" "RT2" {
vpc_id                 = aws_vpc.vpc1.id
route {
    cidr_block         = var.rt_cidr_block
    gateway_id         = aws_nat_gateway.nat2.id
  }
  tags = {
    "Name"             = var.rt_name4
  }
}
resource "aws_route_table_association" "RTA6" {
  subnet_id           = aws_subnet.subnet6.id
  route_table_id      = aws_route_table.RT2.id
}
resource "aws_route_table_association" "RTA7" {
  subnet_id           = aws_subnet.subnet7.id
  route_table_id      = aws_route_table.RT2.id
}
resource "aws_route_table_association" "RTA8" {
  subnet_id           = aws_subnet.subnet8.id
  route_table_id      = aws_route_table.RT2.id
}

# Security Groups
# Security Group1 

resource "aws_security_group" "sg1" {
  vpc_id             = aws_vpc.vpc1.id
  ingress {
    from_port        = var.ingress1_from_port
    to_port          = var.ingress1_to_port
    protocol         = var.ingress1_protocol
    cidr_blocks      = var.ingress_cidr_blocks
  }
  egress {
    from_port        = var.egress1_from_port
    to_port          = var.egress1_to_port
    protocol         = var.egress1_protocol
    cidr_blocks      = var.egress_cidr_blocks
  }
  tags = {
    "Name"           = var.sg1_name
  }
}

resource "aws_security_group" "sg2" {
  vpc_id             = aws_vpc.vpc1.id
  ingress {
    from_port        = var.ingress2_from_port
    to_port          = var.ingress2_to_port
    protocol         = var.ingress2_protocol
    cidr_blocks      = var.ingress_cidr_blocks
  }
  egress {
    from_port        = var.egress2_from_port
    to_port          = var.egress2_to_port
    protocol         = var.egress2_protocol
    cidr_blocks      = var.egress_cidr_blocks
  }
  tags = {
    "Name"           = var.sg2_name
  }
}

resource "aws_security_group" "sg3" {
  vpc_id             = aws_vpc.vpc1.id
  ingress {
    from_port        = var.ingress3_from_port
    to_port          = var.ingress3_to_port
    protocol         = var.ingress3_protocol
    cidr_blocks      = var.ingress_cidr_blocks
  }
  egress {
    from_port        = var.egress3_from_port
    to_port          = var.egress3_to_port
    protocol         = var.egress3_protocol
    cidr_blocks      = var.egress_cidr_blocks
  }
  tags = {
    "Name"           = var.sg3_name
  }
}

resource "aws_security_group" "sg4" {
  vpc_id            = aws_vpc.vpc1.id
  ingress {
    from_port       = var.ingress4_from_port
    to_port         = var.ingress4_to_port
    protocol        = var.ingress4_protocol
    cidr_blocks     = var.ingress_cidr_blocks
  }
  egress {
    from_port       = var.egress4_from_port
    to_port         = var.egress4_to_port
    protocol        = var.egress4_protocol
    cidr_blocks     = var.egress_cidr_blocks
  }
  tags = {
    "Name"          = var.sg4_name
  }
}

resource "aws_security_group" "sg5" {
  vpc_id            = aws_vpc.vpc1.id
  ingress { 
    from_port       = var.ingress5_from_port
    to_port         = var.ingress5_to_port
    protocol        = var.ingress5_protocol
    cidr_blocks     = var.ingress_cidr_blocks
  }
  egress {
    from_port       = var.egress5_from_port
    to_port         = var.egress5_to_port
    protocol        = var.egress5_protocol
    cidr_blocks     = var.egress_cidr_blocks
  }
  tags = {
    "Name"          = var.sg5_name
  }
}

resource "aws_security_group" "sg6" {
  vpc_id            = aws_vpc.vpc1.id
  ingress {
    from_port       = var.ingress6_from_port
    to_port         = var.ingress6_to_port
    protocol        = var.ingress6_protocol
    security_groups = [aws_security_group.sg2.id]
  }
  ingress {
    from_port       = var.ingress6_from_port
    to_port         = var.ingress6_to_port
    protocol        = var.ingress6_protocol
    security_groups = [aws_security_group.sg4.id]
  }
  egress {
    from_port       = var.egress6_from_port
    to_port         = var.egress6_to_port
    protocol        = var.egress6_protocol
    cidr_blocks     = var.egress_cidr_blocks
  }
  tags = {
    "Name"          = var.sg6_name
  }
}
