variable "clients" {
  type        = list(map(string))
  description = "Client list"
}

variable "environment" {
  type        = string
  description = "Environment name"
}

variable "instance_type" {
  type        = string
  description = "Instance type"
  default     = "t2.micro"
}

variable "vpc_name" {
  type        = string
  description = "VPC name"
}

variable "vpc_tenancy" {
  type        = string
  description = "VPC tenancy"
  default     = "default"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR"
  default     = "10.0.0.0/16"
}

variable "remote_access_cidr" {
  type        = list(any)
  default     = []
  description = "A list of IP address to allow for remote access"
}