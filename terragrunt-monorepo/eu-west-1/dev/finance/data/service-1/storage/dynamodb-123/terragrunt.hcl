include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/application/service-1/compute/auto-scaling-561",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-2/security/secrets-140",
    "../../../../../../../../eu-west-1/dev/operations/data/service-2/application/load-balancer-829",
    "../../../../../../../../eu-west-1/qa/finance/data/service-3/monitoring/trace-collection-86",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//dynamodb-123?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "dynamodb-123"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}