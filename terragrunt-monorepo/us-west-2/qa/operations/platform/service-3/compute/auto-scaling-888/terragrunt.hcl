include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/application/service-3/compute/auto-scaling-323",
    "../../../../../../../../us-west-2/qa/finance/data/service-3/monitoring/alertmanager-933",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-1/application/api-gateway-877",
    "../../../../../../../../us-east-1/dev/marketing/application/service-3/security/security-hub-274",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-888?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-888"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}