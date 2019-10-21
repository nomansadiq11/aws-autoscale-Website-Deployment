variable "TagName" {
    default = "Development"
}

variable "VPC_cidr_block" {
    default = "10.0.0.0/16"
}

# variable "VPC_region" {
#     default = "us-east-1"
# }
variable "KeyPair_Name"{
    default = "devopstest"
}

variable "Instance_Image_Id" {
  default = "ami-0b69ea66ff7391e80"
}

variable "Instance_Type" {
  default= "t2.micro"
}


# variable "Count" {
#  default = 1
#  }

# variable "region" {
#  description = "AWS region for hosting our your network"
#  default = "us-east-1"
# }
# variable "public_key_path" {
#  description = "Enter the path to the SSH Public Key to add to AWS."
#  default = "/path_to_keyfile/inoffice.pem"
# }
# variable "key_name" {
#  description = "Key name for SSHing into EC2"
#  default = "inoffice"
# }
# variable "amis" {
#  description = "Base AMI to launch the instances"
#  default = {
#  ap-south-1 = "ami-0b69ea66ff7391e80"
#  }
# }