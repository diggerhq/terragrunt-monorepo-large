include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/application/service-2/security/shield-912",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-1/application/cache-layer-651",
    "../../../../../../../../us-east-1/staging/marketing/data/service-2/storage/rds-293",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-460?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-460"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}