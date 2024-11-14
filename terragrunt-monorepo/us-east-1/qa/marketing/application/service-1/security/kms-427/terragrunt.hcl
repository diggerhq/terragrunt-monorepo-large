include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/platform/service-3/compute/spot-fleet-863",
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/compute/ec2-563",
    "../../../../../../../../us-east-1/dev/marketing/application/service-3/storage/efs-788",
    "../../../../../../../../us-west-2/qa/operations/platform/service-2/network/subnet-167",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//kms-427?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "kms-427"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}