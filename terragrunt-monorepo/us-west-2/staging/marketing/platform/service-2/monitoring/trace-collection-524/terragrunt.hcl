include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/application/service-3/compute/batch-554",
    "../../../../../../../../us-west-2/qa/marketing/application/service-1/security/shield-109",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-1/monitoring/log-aggregation-172",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-2/application/load-balancer-309",
    "../../../../../../../../us-east-1/dev/operations/application/service-1/compute/auto-scaling-806",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-524?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-524"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}