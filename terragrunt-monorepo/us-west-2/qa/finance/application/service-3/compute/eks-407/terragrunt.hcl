include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/platform/service-2/storage/rds-405",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-1/compute/spot-fleet-407",
    "../../../../../../../../eu-west-1/staging/operations/data/service-3/security/kms-975",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//eks-407?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "eks-407"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}