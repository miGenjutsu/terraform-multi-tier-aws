#----------------------------------------------#
# compute-base: variables                      #
# ./modules/aws/compute-base/variables.tf      #
#----------------------------------------------#


variable "ws_tag" {
    description = "webserver tag name"
    type = string
    default = "webserver_tag"
}

variable "public_subnet_id" {
    description = "public subnet id"
    type = string
}

variable "instance_type" {
    description = "instance type used"
    type = string
    default = "t2.micro"
}

variable "security_group_webserver_id" {
    description = "security group used"
    type = string
}

variable "webserver_tag" {
    description = "webserver tag name"
    type = string
    default = "webserver_tag"
}