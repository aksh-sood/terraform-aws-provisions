resource "aws_vpc" "try6" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "try6-vpc"
  }
}

resource "aws_subnet" "try6-pub-1" {
  vpc_id                  = aws_vpc.try6.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    Name = "try6-pub-1"
  }
}

resource "aws_subnet" "try6-pub-2" {
  vpc_id                  = aws_vpc.try6.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2
  tags = {
    Name = "try6-pub-2"
  }
}


resource "aws_subnet" "try6-pub-3" {
  vpc_id                  = aws_vpc.try6.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE3
  tags = {
    Name = "try6-pub-3"
  }
}


resource "aws_subnet" "try6-priv-1" {
  vpc_id                  = aws_vpc.try6.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    Name = "try6-priv-1"
  }
}


resource "aws_subnet" "try6-priv-2" {
  vpc_id                  = aws_vpc.try6.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2
  tags = {
    Name = "try6-priv-2"
  }
}


resource "aws_subnet" "try6-priv-3" {
  vpc_id                  = aws_vpc.try6.id
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE3
  tags = {
    Name = "try6-priv-3"
  }
}

resource "aws_internet_gateway" "try6-IGW" {
  vpc_id = aws_vpc.try6.id
  tags = {
    Name = "try6-IGW"
  }
}

resource "aws_route_table" "try6-pub-RT" {
  vpc_id = aws_vpc.try6.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.try6-IGW.id
  }

  tags = {
    Name = "try6-pub-RT"
  }
}


resource "aws_route_table_association" "try6-pub-1-a" {
  subnet_id      = aws_subnet.try6-pub-1.id
  route_table_id = aws_route_table.try6-pub-RT.id
}

resource "aws_route_table_association" "try6-pub-2-a" {
  subnet_id      = aws_subnet.try6-pub-2.id
  route_table_id = aws_route_table.try6-pub-RT.id
}
resource "aws_route_table_association" "try6-pub-3-a" {
  subnet_id      = aws_subnet.try6-pub-3.id
  route_table_id = aws_route_table.try6-pub-RT.id
}