variable "aws_region" {
  description = "The Amazon region"
  type        = "string"
  default     = "us-east-1"
}

variable "environment" {
  type    = "string"
  default = "blog"
}

variable "ssh_key_file_ecs" {
  default = "generated/id_rsa.pub"
}

variable "key_name" {
  type    = "string"
  default = "test"
}
