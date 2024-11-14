include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/application/service-2/network/subnet-712",
    "../../../../../../../../us-west-2/staging/finance/platform/service-2/compute/auto-scaling-228",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-3/network/subnet-531",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-2/security/certificates-292",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-1/compute/ec2-867",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-413?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-413"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}