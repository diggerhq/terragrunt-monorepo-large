include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/data/service-2/security/iam-246",
    "../../../../../../../../us-east-1/dev/operations/data/service-3/monitoring/log-aggregation-254",
    "../../../../../../../../us-west-2/staging/finance/application/service-2/monitoring/trace-collection-403",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-1/compute/auto-scaling-849",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cloudwatch-410?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cloudwatch-410"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}