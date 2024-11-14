include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/data/service-3/security/security-hub-860",
    "../../../../../../../../us-west-2/dev/finance/platform/service-3/compute/batch-696",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-1/monitoring/log-aggregation-511",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fargate-19?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fargate-19"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}