variable "clients" {
  type        = list(map(string))
  description = "Client list"
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