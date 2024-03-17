# Create a security group for the EC2 instance
resource "aws_security_group" "app_server_sg" {
  name = var.ec2_sg_name
  description = "Security group for Node.js application server"

  vpc_id = aws_vpc.app_vpc.id

  ingress {
    from_port = var.ingress_ssh_port_ec2
    to_port   = var.ingress_ssh_port_ec2
    protocol  = var.ingress_protocol_ec2
    cidr_blocks = ["0.0.0.0/0"]  
  }

  ingress {
    from_port = var.ingress_http_port_ec2
    to_port   = var.ingress_http_port_ec2
    protocol  = var.ingress_protocol_ec2
    cidr_blocks = ["0.0.0.0/0"] 
  }

  egress {
    from_port = var.egress_from_port_ec2
    to_port   = var.egress_to_port_ec2
    protocol  = var.egress_protocol_ec2
    cidr_blocks = ["0.0.0.0/0"] 
  }
}


resource "aws_ec2_instance_connect_endpoint" "ec2_instance_connect_endpoint" {
  subnet_id = aws_subnet.private_subnet1.id
  security_group_ids = [aws_security_group.app_server_sg.id]
  tags = {
    Name = "ec2_endpoint"
}

}

# EC2 Instance
resource "aws_instance" "app_server" {
  ami           = var.ami_id 
  instance_type = var.ec2_instance_type
  
  subnet_id = aws_subnet.private_subnet1.id
  tags = {
    Name = var.ec2_name
  }

  vpc_security_group_ids = [aws_security_group.app_server_sg.id]

}

# Create a security group for the web server EC2 instance
resource "aws_security_group" "web_server_sg" {
  name = "web-sever-sg"
  description = "Security group for Node.js web server"

  vpc_id = aws_vpc.app_vpc.id

  ingress {
    from_port = "22"
    to_port   = "22"
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  
  }

  ingress {
    from_port = "80"
    to_port   = "80"
    protocol  = "80"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  egress {
    from_port = "0"
    to_port   = "0"
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
}
# EC2 Instance
resource "aws_instance" "web_server" {
  ami           = var.ami_id 
  instance_type = var.ec2_instance_type
  associate_public_ip_address = true
  subnet_id = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.web_server_sg.id]

  tags = {
    Name = "web-server"
  }
}