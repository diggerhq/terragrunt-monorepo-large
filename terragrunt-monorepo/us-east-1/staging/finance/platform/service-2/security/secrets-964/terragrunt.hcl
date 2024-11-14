include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/data/service-2/monitoring/log-aggregation-75",
    "../../../../../../../../us-east-1/staging/marketing/application/service-3/security/security-hub-3",
    "../../../../../../../../us-east-1/dev/finance/platform/service-2/compute/eks-281",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//secrets-964?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "secrets-964"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}