include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/data/service-1/monitoring/prometheus-569",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-3/compute/batch-920",
    "../../../../../../../../us-east-1/dev/operations/application/service-1/compute/ecs-904",
    "../../../../../../../../us-east-1/staging/finance/platform/service-2/monitoring/cloudwatch-998",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpn-420?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpn-420"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}