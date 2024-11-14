include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/data/service-2/compute/auto-scaling-650",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-3/application/event-bus-744",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-2/storage/rds-950",
    "../../../../../../../../us-east-1/dev/finance/application/service-3/monitoring/cloudwatch-128",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//security-hub-188?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "security-hub-188"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}