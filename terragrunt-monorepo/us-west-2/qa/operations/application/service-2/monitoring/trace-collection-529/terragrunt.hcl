include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/data/service-1/compute/ec2-809",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-1/application/event-bus-151",
    "../../../../../../../../us-west-2/dev/operations/data/service-1/compute/auto-scaling-221",
    "../../../../../../../../us-east-1/dev/marketing/application/service-3/monitoring/grafana-603",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-529?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-529"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}