include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/data/service-2/compute/lambda-652",
    "../../../../../../../../us-east-1/staging/operations/data/service-2/monitoring/trace-collection-967",
    "../../../../../../../../us-west-2/dev/operations/application/service-3/security/security-hub-396",
    "../../../../../../../../eu-west-1/dev/operations/application/service-2/compute/lambda-157",
    "../../../../../../../../eu-west-1/qa/finance/application/service-2/security/waf-18",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-373?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-373"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}