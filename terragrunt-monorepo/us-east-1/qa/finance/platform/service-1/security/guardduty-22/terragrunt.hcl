include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/data/service-1/monitoring/log-aggregation-106",
    "../../../../../../../../eu-west-1/dev/finance/data/service-1/security/waf-875",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-1/application/load-balancer-494",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-2/compute/ec2-833",
    "../../../../../../../../us-east-1/dev/operations/application/service-3/network/route-table-668",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//guardduty-22?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "guardduty-22"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}