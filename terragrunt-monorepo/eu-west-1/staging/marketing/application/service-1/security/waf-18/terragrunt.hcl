include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/data/service-3/monitoring/log-aggregation-49",
    "../../../../../../../../us-east-1/qa/finance/application/service-2/application/load-balancer-980",
    "../../../../../../../../us-west-2/dev/finance/platform/service-2/network/vpc-330",
    "../../../../../../../../us-east-1/staging/operations/platform/service-1/compute/lambda-123",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//waf-18?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "waf-18"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}