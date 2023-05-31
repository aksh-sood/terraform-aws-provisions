variable "REGION" {
  default = "us-east-1"
}

variable "ZONE1" {
  default = "us-east-1a"
}
variable "ZONE2" {
  default = "us-east-1b"
}
variable "ZONE3" {
  default = "us-east-1c"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = ""
    us-east-2 = ""
  }
}

variable "TYPE" {
  default = "t2.micro"
}

variable "KEY" {
  default = "intern-test"
}

variable "SGID" {
  default = ""
}

variable "TAGS" {
  type = map(any)
  default = {
    Name    = "Aksh Terraform Test"
    Creator = "Aksh through Terraform"
  }
}

variable "USER" {
  default = "ubuntu"
}

variable "BUCKET" {
  default = ""
}

variable "TERRAFORM_KEY" {
  default = ""
}