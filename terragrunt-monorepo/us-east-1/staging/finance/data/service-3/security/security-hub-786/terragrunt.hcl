include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/platform/service-2/monitoring/cloudwatch-825",
    "../../../../../../../../eu-west-1/staging/operations/application/service-2/network/transit-gateway-506",
    "../../../../../../../../us-east-1/dev/finance/platform/service-3/monitoring/prometheus-223",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//security-hub-786?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "security-hub-786"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}