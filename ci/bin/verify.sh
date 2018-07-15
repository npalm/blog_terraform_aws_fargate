#!/usr/bin/env sh

source $(dirname $0)/terraform.sh

TERRAFORM_DIR=${1-:"."}
cd $1

validate
verifyModulesAndPlugins

cd -
