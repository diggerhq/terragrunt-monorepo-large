include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/application/service-1/security/security-hub-44",
    "../../../../../../../../eu-west-1/staging/operations/data/service-2/application/load-balancer-302",
    "../../../../../../../../us-west-2/dev/finance/data/service-3/storage/rds-197",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-3/application/load-balancer-249",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-63?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-63"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}