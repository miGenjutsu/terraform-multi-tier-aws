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