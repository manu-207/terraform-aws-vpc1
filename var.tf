# VPC

variable "vpc_cidr_block" {
  description = "cidr_block"
}
variable "vpc_name" {
  description = "name of the vpc"
}
variable "enable_dns_hostnames" {
  description = "enable_dns_hostnames"
}

#  Subnets

# Subnet1

variable "subnet1_cidr_block" {
  description = "cidr block"
}
variable "availability_zone1" {
  description = "availability_zone1"
}
variable "subnet1_name" {
  description = "name of the subnet"
}

# Subnet2

variable "subnet2_cidr_block" {
  description = "cidr block"
}
variable "availability_zone2" {
  description = "availability_zone1"
}
variable "subnet2_name" {
  description = "name of the subnet"
}

# Subnet3

variable "subnet3_cidr_block" {
  description = "cidr block"
}
variable "subnet3_name" {
  description = "name of the subnet"
}

# Subnet4

variable "subnet4_cidr_block" {
  description = "cidr block"
}
variable "subnet4_name" {
  description = "name of the subnet"
}

# Subnet5

variable "subnet5_cidr_block" {
  description = "cidr block"
}
variable "subnet5_name" {
  description = "name of the subnet"
}

# Subnet6

variable "subnet6_cidr_block" {
  description = "cidr block"
}
variable "subnet6_name" {
  description = "name of the subnet"
}

# Subnet7

variable "subnet7_cidr_block" {
  description = "cidr block"
}
variable "subnet7_name" {
  description = "name of the subnet"
}

# Subnet8

variable "subnet8_cidr_block" {
  description = "cidr block"
}
variable "subnet8_name" {
  description = "name of the subnet"
}

# internet gateway

variable "igw_name" {
  description = "name of the internet gateway"
}

# Creating NAT gateway

variable "nat_name1" {
  description = "name of the nat gateway"
}
variable "nat_name2" {
  description = "name of the nat gateway"
}

# Route table

variable "rt_cidr_block" {
  description = "rt_cidr_block"
}
variable "rt_name1" {
  description = "name of the route table"
}
variable "rt_name2" {
  description = "name of the route table"
}
variable "rt_name3" {
  description = "name of the route table"
}
variable "rt_name4" {
  description = "name of the route table"
}

# Security group 1

variable "ingress1_from_port" {
  description = "ingress_from port number"
}
variable "ingress1_to_port" {
  description = "ingress_to_port number"
}
variable "ingress1_protocol" {
  description = "ingress protocol name"
}
variable "ingress_cidr_blocks" {
  description = "ingress_cidr_blocks"
}
variable "egress1_from_port" {
  description = "ingress_from_port number"
}
variable "egress1_to_port" {
  description = "egress_to_port number"
}
variable "egress1_protocol" {
  description = "egress_protocol"
}
variable "egress_cidr_blocks" {
  description = "egress_cidr_blocks"
}
variable "sg1_name" {
  description = "sg1_name"
}
#
# security group 2

variable "ingress2_from_port" {
  description = "ingress2_from_port"
}
variable "ingress2_to_port" {
  description = "ingress2_to_port"
}
variable "ingress2_protocol" {
  description = "ingress protocol name"
}
variable "egress2_from_port" {
  description = "egress_from_port"
}
variable "egress2_to_port" {
  description = "engress_to_port"
}
variable "egress2_protocol" {
  description = "egress_protocol"
}
variable "sg2_name" {
  description = "sg2_name"
}

# security group 3

variable "ingress3_from_port" {
  description = "ingress3_from_port"
}
variable "ingress3_to_port" {
  description = "ingress3_to_port"
}
variable "ingress3_protocol" {
  description = "ingress protocol name"
}
variable "egress3_from_port" {
  description = "egress3_from_port"
}
variable "egress3_to_port" {
  description = "engress3_to_port"
}
variable "egress3_protocol" {
  description = "egress_protocol"
}
variable "sg3_name" {
  description = "sg3_name"
}

# security group 4

variable "ingress4_from_port" {
  description = "ingress_from_port"
}
variable "ingress4_to_port" {
  description = "ingress_to_port"
}
variable "ingress4_protocol" {
  description = "ingress protocol name"
}
variable "egress4_from_port" {
  description = "egress_from_port"
}
variable "egress4_to_port" {
  description = "engress_to_port"
}
variable "egress4_protocol" {
  description = "egress_protocol"
}
variable "sg4_name" {
  description = "sg4_name"
}

# security group 5

variable "ingress5_from_port" {
  description = "ingress_from_port"
}
variable "ingress5_to_port" {
  description = "ingress_to_port"
}
variable "ingress5_protocol" {
  description = "ingress protocol name"
}
variable "egress5_from_port" {
  description = "egress_from_port"
}
variable "egress5_to_port" {
  description = "engress_to_port"
}
variable "egress5_protocol" {
  description = "egress_protocol"
}
variable "sg5_name" {
  description = "sg5_name"
}

# security group 6

variable "ingress6_from_port" {
  description = "ingress_from_port"
}
variable "ingress6_to_port" {
  description = "ingress_to_port"
}
variable "ingress6_protocol" {
  description = "ingress protocol name"
}
variable "egress6_from_port" {
  description = "egress_from_port"
}
variable "egress6_to_port" {
  description = "engress_to_port"
}
variable "egress6_protocol" {
  description = "egress_protocol"
}
variable "sg6_name" {
  description = "security group name"
}