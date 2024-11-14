include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/data/service-3/network/direct-connect-869",
    "../../../../../../../../eu-west-1/staging/operations/application/service-1/monitoring/log-aggregation-798",
    "../../../../../../../../us-west-2/staging/operations/data/service-3/compute/auto-scaling-460",
    "../../../../../../../../us-east-1/dev/finance/application/service-1/application/service-mesh-212",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-1/security/iam-285",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//waf-121?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "waf-121"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}