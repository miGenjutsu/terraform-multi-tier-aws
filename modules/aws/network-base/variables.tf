#----------------------------------------------#
# network-base: variables                      #
# ./modules/aws/network-base/variables.tf      #
#----------------------------------------------#


variable "cidr_range" {
    description = "cidr range for vpc"
    type = string
    default = "172.69.0.0/16"
}

variable "vpc_tag" {
    description = "vpc tag name"
    type = string
    default = "vpc_name"
}

# PUBLIC SUBNET
variable "pub_sub_cidr" {
    description = "public subnet cidr range"
    type = string
    default = "172.69.1.0/24"
}

variable "pub_sub_tag" {
    description = "public subnet tag name"
    type = string
    default = "public_subnet"
}


# PRVATE SUBNETS
variable "priv_sub_cidr" {
    description = "private subnet cidr range"
    type = string
    default = "172.69.2.0/24"
}

variable "priv_sub_tag" {
    description = "private subnet tag name"
    type = string
    default = "private_subnet"
}

