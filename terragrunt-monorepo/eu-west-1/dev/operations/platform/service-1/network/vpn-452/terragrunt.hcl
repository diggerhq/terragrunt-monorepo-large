include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/platform/service-2/compute/ec2-7",
    "../../../../../../../../us-east-1/staging/operations/platform/service-1/application/load-balancer-164",
    "../../../../../../../../eu-west-1/dev/operations/data/service-3/application/queue-347",
    "../../../../../../../../eu-west-1/staging/operations/application/service-2/monitoring/log-aggregation-708",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpn-452?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpn-452"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}