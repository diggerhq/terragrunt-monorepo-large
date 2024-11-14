include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/platform/service-1/compute/auto-scaling-68",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-3/monitoring/prometheus-632",
    "../../../../../../../../eu-west-1/dev/finance/application/service-3/compute/spot-fleet-379",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//s3-623?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "s3-623"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}