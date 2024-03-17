
 
###################        vpc Variables        ########################
variable "region" {
  type = string
  description = "region for vpc"
}

variable "vpc_name" {
  type = string
  description = "app-vpc"
}

variable "vpc_cidr_block" {
  type = string
  description = "CIDR block for the vpc"
}

variable "ec2_subnet_cidr" {
  type = string
  description = "CIDR block for the ec2 subnet"
}

variable "rds_subnet_cidr" {
  type = string
  description = "CIDR block for the rds subnet"
}

variable "availability_zone1" {
  type        = string
  description = "name of availability zones"
}

variable "availability_zone2" {
  type        = string
  description = "name of availability zones"
}

variable "create_nat_gateway" {
  type        = bool
  description = "whether to create a NAT gateway or not"
}

variable "enable_dns_support" {
  type        = bool
  description = "whether to enable DNS support or not"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "whether to enable DNS hostnames or not"
}

variable "destination_cidr_block" {
  type        = string
  description = "Set the destination cidr block"
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "whether to map public ip on launch or not"
}

variable "create_s3_endpoint" {
  type        = bool
  description = "whether to create s3 endpoint or not"
}

variable "domain" {
  type        = string
  description = "Set the domain of eip"
}

variable "ec2_private_subnet_name" {
  type = string
  description = "name of the ec2 private subnet"
  
}

variable "rds_private_subnet_name" {
  type = string
  description = "name of the rds private subnet"
  
}

variable "internet_gateway_name" {
  type = string
  description = "name of the internet gateway"
}

variable "ec2_priate_rt_name" {
  type = string
  description = "name of private route table for ec2"
}

variable "rds_priate_rt_name" {
  type = string
  description = "name of private route table for rds"
}

variable "nat_gateway_name" {
  type = string
  description = "name of nat gateway of app vpc"
}

variable "eip_name" {
  type = string
  description = "Elastic IP for NAT Gateway"
}

variable "public_subnet_cidr" {
  type = string
  description = "cidr block for public subnet"
}

variable "public_subnet_name" {
  type = string
  description = "name of the public subnet"
}


##########     ec2 variables    #################

variable "ami_id" {
  type = string
  description = "ami id of amazon linux ap-south-1"
}

variable "ec2_sg_name" {
  type = string
  description = "name of the ec2 instance"
}

variable "ingress_protocol_ec2" {
  type = string
  description = "protocols used for ingresss in ec2 security groups"
}

variable "ingress_ssh_port_ec2" {
  type = string
  description = "ssh port for ingress rules of ec2 security group"
}

variable "ingress_http_port_ec2" {
  type = string
  description = "http port for ingress rules of ec2 security group"
}

variable "ingress_cidr_ec2" {
  type = string
  description = "cidr block ec2 security group"
}

variable "egress_cidr_ec2" {
  type = string
  description = "cidr block ec2 security group"
}

variable "egress_from_port_ec2" {
  type = string
  description = "egress rules of ec2 security group"
}

variable "egress_to_port_ec2" {
  type = string
  description = "egress rules of ec2 security group"
}

variable "egress_protocol_ec2" {
  type = string
  description = "engress rules of ec2 security group"
}

variable "ec2_instance_type" {
  type = string
  description = "t2.micro"
}

variable "ec2_name" {
  type = string
  description = "app_server"
}

variable "enable_ec2_instance_connect" {
  type = bool
  description = "Whether to enable EC2 Instance Connect"
  default = true
}

#############    rds    ##################
variable "rds_instance_name" {
  type = string
  description = "name of rds instance"
  
}
variable "rds_db_grp_name" {
  type = string
  description = "Subnet group for RDS instance"
}

variable "rds_storage" {
  type = string
  description = "storage size for the rds db"
  
}

variable "rds_engine_name" {
  type = string
  description = "name of the rds engine"
}

variable "rds_engine_version" {
  type = string
  description = "version of the rds engine"
}

variable "rds_engine_insance_class" {
  type = string
  description = "instance class of the rds engine"
}

variable "rds_sg_id" {
  type = string
  description = "sg id for rds"
}
variable "db_name" {
  type = string
  description = "Database name for rds"
}

variable "db_username" {
  type = string
  description = " username for rds database"
}

variable "db_password" {
  type = string
  description = "password for rds database"
}



