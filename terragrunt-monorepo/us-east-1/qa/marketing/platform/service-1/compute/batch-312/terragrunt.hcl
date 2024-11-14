include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/platform/service-2/compute/ec2-973",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-3/monitoring/trace-collection-203",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-2/monitoring/log-aggregation-497",
    "../../../../../../../../us-east-1/staging/finance/data/service-3/security/waf-46",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//batch-312?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "batch-312"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}