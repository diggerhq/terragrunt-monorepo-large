include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/data/service-1/compute/ec2-90",
    "../../../../../../../../us-west-2/qa/marketing/data/service-1/application/cache-layer-450",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-2/security/guardduty-203",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-1/network/direct-connect-254",
    "../../../../../../../../us-west-2/qa/operations/platform/service-1/storage/efs-651",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpc-612?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpc-612"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}