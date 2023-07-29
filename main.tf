#----------------------------------------------#
# root: main                                   #
# ./main.tf                                    #
#----------------------------------------------#


provider "aws" {
  region = var.aws_region
}

module "network-base" {
  source = "./modules/aws/network-base/"
}

module "compute-base" {
  source = "./modules/aws/compute-base/"
  public_subnet_id = module.network-base.public_subnet_output
  security_group_webserver_id = module.network-base.sg_webserver_output
}