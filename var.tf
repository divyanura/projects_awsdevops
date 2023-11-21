variable "ami" {
  default = "ami-0fc5d935ebf8bc3bc"
}

variable "instance_type" {
  default = "t2.medium"
}

variable "key_name" {
  default = "project1"
}

variable "subnet_id" {
  default = "subnet-08be25aaaa11c3766"
}

variable "vpc_security_group_ids" {
  default = "sg-0529805ea8638408a"
}

variable "iam_instance_profile" {
  default = "ssmconnect"
}