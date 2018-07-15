[![Build Status](https://travis-ci.com/npalm/blog_terraform_aws_fargate.svg?branch=master)](https://travis-ci.com/npalm/blog_terraform_aws_fargate)
# Code for blog post

This repo contains two examples for using Fragate and EC2 on ECS with Terraform. Both samples are discussed in a blog post: https://040code.github.io/2018/01/30/fargate_with_terraform/

- fargate: a fargate only example
- fargate-ec2: a example based on some generic modules to mix fargate and ec2 with ECS.

## Usage

Both examples can be deployed using terraform 0.11.*. Install terraform manually or use the tool tfenv. Deploying the examples is as simple as:

```
terraform init
terraform apply
```

To cleanup simple run
```
terraform destroy
```
