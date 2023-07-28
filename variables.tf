#----------------------------------------------#
# root: variables                              #
# ./variables.tf                               #
#----------------------------------------------#



variable "aws_region" {
    description = "aws region for infrastructure"
    type = string
    default = "us-east-1"
}