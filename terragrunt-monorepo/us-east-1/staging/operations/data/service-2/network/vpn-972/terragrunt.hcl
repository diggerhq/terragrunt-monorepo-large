include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/data/service-2/compute/ec2-873",
    "../../../../../../../../eu-west-1/staging/operations/data/service-1/compute/lambda-988",
    "../../../../../../../../us-west-2/dev/finance/platform/service-2/compute/eks-561",
    "../../../../../../../../us-east-1/dev/finance/data/service-1/compute/lambda-721",
    "../../../../../../../../us-west-2/qa/finance/platform/service-1/network/subnet-164",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpn-972?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpn-972"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}