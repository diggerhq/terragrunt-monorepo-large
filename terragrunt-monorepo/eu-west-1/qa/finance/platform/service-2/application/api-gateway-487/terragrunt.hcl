include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/data/service-1/monitoring/alertmanager-879",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-2/security/security-hub-122",
    "../../../../../../../../us-east-1/qa/marketing/data/service-2/security/certificates-872",
    "../../../../../../../../us-west-2/qa/finance/platform/service-3/network/endpoint-776",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//api-gateway-487?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "api-gateway-487"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}