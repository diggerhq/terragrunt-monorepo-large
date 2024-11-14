include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/platform/service-1/application/service-mesh-322",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-2/monitoring/prometheus-54",
    "../../../../../../../../us-east-1/staging/operations/application/service-3/monitoring/cloudwatch-410",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//shield-683?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "shield-683"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}