# Create a DB subnet group
resource "aws_db_subnet_group" "app_db_subnet_group" {
  name = var.rds_db_grp_name
  description = "Subnet group for RDS instance"

  subnet_ids = [
    aws_subnet.private_subnet1.id,
    aws_subnet.private_subnet2.id
  ]

  tags = {
    Name = var.rds_db_grp_name
  }
}

#RDS_SG
resource "aws_security_group" "RDS_SG"{
    name = "RDS_Security_Group"
    description = "To allow MySQL connection"
    vpc_id = aws_vpc.app_vpc.id

 ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
 }

 egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
 }

 tags = {
    Name = "RDS_SG"
}
}


# Create an RDS instance
resource "aws_db_instance" "rds_instance" {
  allocated_storage = var.rds_storage
  engine           =  var.rds_engine_name
  engine_version   =  var.rds_engine_version
  instance_class    = var.rds_engine_insance_class
  publicly_accessible    = true
  skip_final_snapshot = true
  db_subnet_group_name = aws_db_subnet_group.app_db_subnet_group.id
  # VPC security group 
  vpc_security_group_ids = [aws_security_group.RDS_SG.id]
  db_name = var.db_name
  username = var.db_username
  password = var.db_password

   tags = {
    Name = var.rds_instance_name
  }
}

