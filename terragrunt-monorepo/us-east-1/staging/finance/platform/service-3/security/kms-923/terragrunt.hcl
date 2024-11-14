include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/platform/service-1/network/vpc-185",
    "../../../../../../../../eu-west-1/qa/operations/data/service-1/application/cache-layer-261",
    "../../../../../../../../us-west-2/qa/finance/application/service-2/security/guardduty-4",
    "../../../../../../../../eu-west-1/qa/operations/data/service-3/compute/ec2-568",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//kms-923?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "kms-923"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}