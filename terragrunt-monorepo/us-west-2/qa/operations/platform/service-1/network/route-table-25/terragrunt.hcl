include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/application/service-3/compute/lambda-209",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-2/security/security-hub-507",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-3/application/api-gateway-226",
    "../../../../../../../../us-east-1/dev/marketing/data/service-1/monitoring/alertmanager-550",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//route-table-25?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "route-table-25"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}