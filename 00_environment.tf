provider "aws" {
  region  = "us-east-1"
  version = "1.7.1"
}

module "vpc" {
  source  = "npalm/vpc/aws"
  version = "1.1.0"

  environment = "blog"
  aws_region  = "us-east-1"

  // optional, defaults
  create_private_hosted_zone = "false"

  // example to override default availability_zones
  availability_zones = {
    us-east-1 = ["us-east-1a", "us-east-1b", "us-east-1c"]
  }
}

resource "aws_ecs_cluster" "cluster" {
  name = "blog-ecs-cluster"
}

resource "aws_cloudwatch_log_group" "log_group" {
  name = "blog"
}
