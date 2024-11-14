include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/data/service-3/monitoring/cloudwatch-186",
    "../../../../../../../../us-west-2/qa/finance/application/service-2/monitoring/prometheus-346",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-3/security/iam-374",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-1/application/api-gateway-877",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//backup-594?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "backup-594"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}