include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/application/service-1/network/nacl-600",
    "../../../../../../../../eu-west-1/staging/finance/data/service-1/security/waf-829",
    "../../../../../../../../us-east-1/qa/finance/application/service-2/security/waf-507",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-2/security/secrets-387",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-1/monitoring/cloudwatch-830",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-894?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-894"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}