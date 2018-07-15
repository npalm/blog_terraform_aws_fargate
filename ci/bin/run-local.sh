#!/usr/bin/env sh

docker run --entrypoint="ci/bin/verify.sh" -it --rm -w /build -v $(pwd):/build hashicorp/terraform:0.11.7 fargate
docker run --entrypoint="ci/bin/verify.sh" -it --rm -w /build -v $(pwd):/build hashicorp/terraform:0.11.7 fargate-ec2
