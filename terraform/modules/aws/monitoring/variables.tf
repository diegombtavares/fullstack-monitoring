variable "ami_id" {
  default = "ami-020cba7c55df1f615"
}

variable "instance_type" {
  default = "t3.large"
}

variable "key_name" {
  default = "impacta"
}

variable "allowed_ports" {
  default = [22, 80, 5555]
}

variable "cidr_blocks" {
  default = ["0.0.0.0/0"]
}