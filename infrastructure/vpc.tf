resource "aws_vpc" "web_server_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "web-server-vpc"
  }
}

resource "aws_subnet" "web_server_subnet_1" {
  vpc_id                  = aws_vpc.web_server_vpc.id
  cidr_block              = "10.0.0.0/18"
  availability_zone_id    = "aps1-az1"
  map_public_ip_on_launch = true
  tags = {
    Name                                   = "web-server-subnet-1"
    "kubernetes.io/cluster/web-server-eks" = "shared"
  }
}
resource "aws_subnet" "web_server_subnet_2" {
  vpc_id                  = aws_vpc.web_server_vpc.id
  cidr_block              = "10.0.64.0/18"
  availability_zone_id    = "aps1-az2"
  map_public_ip_on_launch = true
  tags = {
    Name                                   = "web-server-subnet-2"
    "kubernetes.io/cluster/web-server-eks" = "shared"

  }
}
resource "aws_subnet" "web_server_subnet_3" {
  vpc_id                  = aws_vpc.web_server_vpc.id
  cidr_block              = "10.0.128.0/18"
  availability_zone_id    = "aps1-az3"
  map_public_ip_on_launch = true
  tags = {
    Name                                   = "web-server-subnet-3"
    "kubernetes.io/cluster/web-server-eks" = "shared"
  }
}

resource "aws_subnet" "web_server_subnet_4" {
  vpc_id                  = aws_vpc.web_server_vpc.id
  cidr_block              = "10.0.192.0/18"
  availability_zone_id    = "aps1-az1"
  map_public_ip_on_launch = true
  tags = {
    Name                                   = "web-server-subnet-4"
    "kubernetes.io/cluster/web-server-eks" = "shared"
  }
}

resource "aws_internet_gateway" "web_server_internet-gateway" {
  vpc_id = aws_vpc.web_server_vpc.id

  tags = {
    Name = "web-server-internet-gateway"
  }
}

resource "aws_route_table" "web_server_route_table" {
  vpc_id = aws_vpc.web_server_vpc.id

  tags = {
    Name = "web-server-route-table"
  }
}

resource "aws_route_table_association" "web_server_subnet_1_vpc_route_table_association" {
  subnet_id      = aws_subnet.web_server_subnet_1.id
  route_table_id = aws_route_table.web_server_route_table.id

}
resource "aws_route_table_association" "web_server_subnet_2_vpc_route_table_association" {
  subnet_id      = aws_subnet.web_server_subnet_2.id
  route_table_id = aws_route_table.web_server_route_table.id

}
resource "aws_route_table_association" "web_server_subnet_3_vpc_route_table_association" {
  subnet_id      = aws_subnet.web_server_subnet_3.id
  route_table_id = aws_route_table.web_server_route_table.id

}

resource "aws_route_table_association" "web_server_subnet_4_vpc_route_table_association" {
  subnet_id      = aws_subnet.web_server_subnet_4.id
  route_table_id = aws_route_table.web_server_route_table.id

}

resource "aws_route" "web_server_route_gateway_association" {
  route_table_id         = aws_route_table.web_server_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.web_server_internet-gateway.id
}

