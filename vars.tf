variable "AWS_REGION" {
  default = "us-east-2"
}

variable "ZONE1" {
  default = "us-east-2a"
}

variable "ZONE2" {
  default = "us-east-2b"
}

variable "ZONE3" {
  default = "us-east-2c"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-2 = "ami-0fb653ca2d3203ac1"
    us-east-1 = "ami-03ededff12e34e59e"
  }
}

variable "USER" {
  default = "ubuntu"
}

variable "MYIP" {
  default = "105.112.0.0/16"
}

variable "PRIV_KEY_PATH" {
  default = "belikebro"
}

variable "PUB_KEY_PATH" {
  default = "belikebro.pub"
}

variable "rmquser" {
  default = "belikebro"
}

variable "rmqpass" {
  default = "belikebro123456"
}

variable "dbuser" {
  default = "belikebro"
}

variable "dbpass" {
  default = "belikebro123456"
}

variable "dbname" {
  default = "accounts"
}

variable "instance_count" {
  default = "1"
}

variable "VPC_NAME" {
  default = "belikebro-VPC"
}

variable "VPC_CIDR" {
  default = "172.21.0.0/16"
}

variable "pubSub1CIDR" {
  default = "172.21.1.0/24"
}

variable "pubSub2CIDR" {
  default = "172.21.2.0/24"
}

variable "pubSub3CIDR" {
  default = "172.21.3.0/24"
}

variable "privSub1CIDR" {
  default = "172.21.4.0/24"
}

variable "privSub2CIDR" {
  default = "172.21.5.0/24"
}

variable "privSub3CIDR" {
  default = "172.21.7.0/24"
}