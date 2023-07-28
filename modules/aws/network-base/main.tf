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


resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id

    tags = {
        Name = var.igw_tag
    }
}

resource "aws_security_group" "sg_apache" {
    vpc_id = aws_vpc.vpc.id
    name = join("_", ["webserver-sg", aws_vpc.vpc.id])
    dynamic "ingress" {
        for_each = var.public_rules
        content {
            from_port = ingress.value["port"]
            to_port = ingress.value["port"]
            protocol = ingress.value["porto"]
            cidr_blocks = ingress.value["cidr_blocks"]
        }
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = var.sg_apache_tag
    }
}

resource "aws_security_group" "sg_rds" {
    vpc_id = aws_vpc.vpc.id
    name = join("_", ["database-sg", aws_vpc.vpc.id])
    ingress {
        description = "Allow traffic"
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        # cidr_blocks = ["10.0.0.0/24"] # replace this with the actual source IP range of your application servers
    }

    tags = {
        Name = var.sg_rds_tag
    }
}
