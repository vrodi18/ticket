# module "ASG" {
#   source              = "../terraform-aws-asg-project"
#   region              = var.region
#   max_size            = var.max_size
#   min_size            = var.min_size
#   desired_capacity    = var.desired_capacity
#   ami_id              = var.ami_id             
#   ami_id_DB           = var.ami_id_DB
#   vpc_id              = module.vpc-project.vpc
#   private_subnet1     = module.vpc-project.private_subnets[0]             
#   private_subnet2     = module.vpc-project.private_subnets[1]
#   private_subnet3     = module.vpc-project.private_subnets[2]
#   public_subnet1      = module.vpc-project.public_subnets[0]   
#   public_subnet2      = module.vpc-project.public_subnets[1]
#   public_subnet3      = module.vpc-project.public_subnets[2]

#   instance_type = var.instance_type
 
# }

module "vpc-project" {
  source        = "../terraform-aws-vpc"
  region        = var.region
  cidr_block    = var.cidr_block
  dns_name      = module.instance.DNS
  vm1_ip        = module.instance.Ubuntu1
  vm2_ip        = module.instance.Ubuntu2



  public_cidr1  = var.public_subnet1
  public_cidr2  = var.public_subnet2
  dns_zone      = var.dns_zone
  lb_record     = "dh.smoothiemachine.local"
  vm1_record    = "Web0.smoothiemachine.local"
  vm2_record    = "Web1.smoothiemachine.local"

  
  tags = {
    Name    = "VPC"
}
}

module "instance" {
  source        = "../ubuntu"
  region        = var.region
  vpc_id        = module.vpc-project.vpc
  public_subnet1  = module.vpc-project.public_subnets[0]
  public_subnet2  = module.vpc-project.public_subnets[1]
  ami_id = "ami-0857b0ef93a75300f"
}
  