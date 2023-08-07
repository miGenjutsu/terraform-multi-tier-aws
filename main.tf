#----------------------------------------------#
# root: main                                   #
# ./main.tf                                    #
#----------------------------------------------#


provider "aws" {
  region = var.aws_region
}

module "network-base" {
  source = "./modules/aws/network-base/"



  #   cidr_range = var.cidr_range
  #   vpc_tag = var.vpc_tag

  #   pub_sub_cidr = var.pub_sub_cidr
  #   pub_sub_tag = var.pub_sub_tag

  #   priv_sub_cidr = var.priv_sub_cidr
  #   priv_sub_tag = var.priv_sub_tag

  #   igw_tag = var.igw_tag

  #   sg_apache_tag = var.sg_apache_tag
  #   sg_rds_tag = var.sg_rds_tag

  #   rtb_tag = var.rtb_tag
  # }

  # module "compute-base" {
  #   source = "./modules/aws/compute-base/"

  #   ws_tag = var.ws_tag
  #   public_subnet_id = var.public_subnet_id
  #   instance_type = var.instance_type
  #   security_group_webserver_id = var.security_group_webserver_id
  #   webserver_tag = var.webserver_tag
  #   private_subnet_id = var.private_subnet_id
  #   # prvate_security_group_id = var.private_security_group_id
  #   database_tag = var.database_tag
}

module "compute-base" {
  source = "./modules/aws/compute-base"

  public_subnet_id  = module.network-base.public_subnet_output
  private_subnet_id = module.network-base.private_subnet_output

  security_group_webserver_id = module.network-base.sg_webserver_output
}
