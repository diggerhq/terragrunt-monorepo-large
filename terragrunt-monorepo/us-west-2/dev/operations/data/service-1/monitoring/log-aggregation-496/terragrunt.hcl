include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/data/service-2/application/load-balancer-736",
    "../../../../../../../../us-west-2/qa/marketing/data/service-3/monitoring/cloudwatch-538",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-3/security/guardduty-912",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-496?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-496"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}