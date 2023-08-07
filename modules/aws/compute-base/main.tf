#----------------------------------------------#
# compute-base: main                           #
# ./modules/aws/compute-base/main.tf           #
#----------------------------------------------#

data "aws_ssm_parameter" "ami_id" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}


# Key Pair
resource "aws_key_pair" "deployer" {
  key_name   = "provision_key"
  public_key = file("~/.ssh/terraform_multi_init.pub") # envy:wsl::ubuntu
  # public_key = file("~/.ssh/terraform_multi_init.pub") # work:wsl::ubuntu
}

resource "aws_instance" "apache_ws" {
  ami                         = data.aws_ssm_parameter.ami_id.value
  subnet_id                   = var.public_subnet_id
  instance_type               = var.instance_type
  security_groups             = [var.security_group_webserver_id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.deployer.key_name
  user_data                   = fileexists("files/apache_install.sh") ? file("files/apache_install.sh") : null

  tags = {
    # Name = var.webserver_tag
    Name = var.ws_tag
  }
}


# Database 
resource "aws_instance" "database_instance" {
  ami           = data.aws_ssm_parameter.ami_id.value
  subnet_id     = var.private_subnet_id
  instance_type = var.instance_type
  # security_groups = [var.private_security_group_id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.deployer.key_name
  # user_data                   = fileexists("./files/mysql_install.sh") ? file("./files/mysql_install.sh") : null
  # user_data = file("files/mysql_install.sh")


  tags = {
    # Name = var.database_tag
    Name = var.database_tag
  }
}
