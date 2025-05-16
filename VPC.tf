# Create your VPC 
resource "aws_vpc" "Myvpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "MyTerraformVPC"
  }
}

# Create a public subnet
resource "aws_subnet" "PublicSubnet" {
  vpc_id     = aws_vpc.Myvpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"  # Optional: specify AZ for better control
  map_public_ip_on_launch = true   # Important: allow auto-assign public IPs

  tags = {
    Name = "PublicSubnet"
  }
}

# Create a private subnet
resource "aws_subnet" "PrivateSubnet" {
  vpc_id     = aws_vpc.Myvpc.id
  cidr_block = "10.0.2.0/24"  # Changed to avoid CIDR conflict with PublicSubnet
  availability_zone = "ap-south1"  

  tags = {
    Name = "PrivateSubnet"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.Myvpc.id

  tags = {
    Name = "IGW"
  }
}

# Create route table for public subnet
resource "aws_route_table" "publicRT" {
  vpc_id = aws_vpc.Myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "PublicRouteTable"
  }
}

# Route table association for public subnet
resource "aws_route_table_association" "publicRTassociation" {
  subnet_id      = aws_subnet.PublicSubnet.id
  route_table_id = aws_route_table.publicRT.id
}

