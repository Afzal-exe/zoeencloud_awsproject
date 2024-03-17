#vpc
region               = "ap-south-1"
vpc_cidr_block       = "10.0.0.0/16" 
# instance_tenancy     = "default"
enable_dns_support   = true
enable_dns_hostnames = true
vpc_name = "app-vpc"

#nat-gateway
create_nat_gateway = true
nat_gateway_name = "app-vpc-nat-gateway"

#internet gateway
internet_gateway_name = "app-vpc-internet-gateway"
eip_name = "app-vpc-nat-eip"

#route-table
destination_cidr_block = "0.0.0.0/0"
ec2_priate_rt_name = "private-route-table-ec2"
rds_priate_rt_name = "private-route-table-rds"


map_public_ip_on_launch  = false


#subnets
ec2_subnet_cidr = "10.0.1.0/24"
ec2_private_subnet_name = "ec2_subnet"

rds_subnet_cidr = "10.0.2.0/24"
rds_private_subnet_name = "rds_subnet"

public_subnet_cidr = "10.0.3.0/24"
public_subnet_name = "public_subnet"

# Availability Zones
availability_zone1 = "ap-south-1a"
availability_zone2 = "ap-south-1b"

domain = "vpc"

create_s3_endpoint = false

# ec2 vars
ami_id = "ami-03bb6d83c60fc5f7c"
ec2_sg_name = "app_server_sg"
ingress_protocol_ec2 = "tcp"
ingress_ssh_port_ec2 = "22"
ingress_http_port_ec2 = "80"
ingress_cidr_ec2 = "0.0.0.0/0"
egress_cidr_ec2 = "0.0.0.0/0"
egress_from_port_ec2 = "0"
egress_to_port_ec2 = "0"
egress_protocol_ec2 = "-1"
ec2_instance_type = "t2.micro"
ec2_name = "app_server"


# rds vars
rds_instance_name = "app-rds-instance"
rds_db_grp_name = "app_db_subnet_group"
rds_sg_id = "sg-09ad7eb468ab5d835"
rds_storage = "20"
rds_engine_name = "mysql"
rds_engine_version = "8.0"
rds_engine_insance_class = "db.t2.micro"
db_name = "my_database"
db_username = "afzal"
db_password = "mera_password"


