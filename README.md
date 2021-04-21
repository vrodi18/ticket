# terraform WordPress and MariaDB module
[![CI](https://travis-ci.org/sadsfae/ansible-elk.svg?branch=master)](https://travis-ci.org/sadsfae/ansible-elk)
This module will create a WordPress Server ASG on public subnet and MariaDB ASG on private subnet in  provided VPC

```
module "ASG" {
  source              = "../terraform-aws-asg-project"
  region              = var.region
  max_size            = var.max_size
  min_size            = var.min_size
  desired_capacity    = var.desired_capacity
  ami_id              = var.ami_id             
  ami_id_DB           = var.ami_id_DB
  vpc_id              = module.vpc-project.vpc
  private_subnet1     = module.vpc-project.private_subnets[0]             
  private_subnet2     = module.vpc-project.private_subnets[1]
  private_subnet3     = module.vpc-project.private_subnets[2]
  public_subnet1      = module.vpc-project.public_subnets[0]   
  public_subnet2      = module.vpc-project.public_subnets[1]
  public_subnet3      = module.vpc-project.public_subnets[2]

  instance_type = var.instance_type
 
}

module "vpc-project" {
  source        = "../terraform-aws-vpc"
  region        = var.region
  cidr_block    = var.cidr_block
  public_cidr1  = var.public_subnet1
  public_cidr2  = var.public_subnet2
  public_cidr3  = var.public_subnet3
  private_cidr1 = var.private_subnet1
  private_cidr2 = var.private_subnet2
  private_cidr3 = var.private_subnet3
  tags = {
    Name    = "VPC"
    Team    = "Fail Fast"
}
}
```

### Create "regions" folder. Inside "regions" create following files with needed content :
* Virginia.tfvars
```
region              = "us-east-1"
max_size            = 4
min_size            = 1
desired_capacity    = 1

cidr_block          = "10.0.0.0/16"
private_cidr_block1 = "10.0.1.0/24"
private_cidr_block2 = "10.0.2.0/24"
private_cidr_block3 = "10.0.3.0/24"
public_subnet1  = "10.0.101.0/24"
public_subnet2  = "10.0.102.0/24"
public_subnet3  = "10.0.103.0/24"


ami_id              =  "ami-00e87074e52e6c9f9" 
instance_type       = "t2.micro"
ami_id_DB           =  "ami-00e87074e52e6c9f9"                       

tags = {
    Name        = "ASG_Project"
    Environment = "Dev"
    Team        = "Infrastrucure"
    Department  = "IT"
    }
```
### Use following command to run this module:
    * terraform init
    * terraform apply -var-file region/Virginia.tfvars
    * terraform apply -var-file region/Ohio.tfvars
    * terraform apply -var-file region/Oregon.tfvars
    * terraform apply -var-file region/California.tfvars