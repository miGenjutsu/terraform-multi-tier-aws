#----------------------------------------------#
# network-base: main                           #
# ./modules/aws/network-base/main.tf           #
#----------------------------------------------#


resource "aws_vpc" "vpc" {
    cidr_block = var.cidr_range

    tags = {
        Name = var.vpc_tag
    }
}

resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.pub_sub_cidr

    tags = {
        Name = var.pub_sub_tag
    }
}

resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.priv_sub_cidr

    tags = {
        Name = var.priv_sub_tag
    }
}

