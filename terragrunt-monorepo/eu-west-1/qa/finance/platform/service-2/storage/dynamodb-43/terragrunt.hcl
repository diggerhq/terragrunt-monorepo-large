include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/application/service-3/monitoring/log-aggregation-502",
    "../../../../../../../../us-east-1/dev/operations/application/service-1/compute/lambda-356",
    "../../../../../../../../us-east-1/staging/finance/application/service-1/security/waf-121",
    "../../../../../../../../eu-west-1/qa/finance/application/service-2/network/transit-gateway-657",
    "../../../../../../../../us-west-2/staging/operations/data/service-3/network/vpn-222",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//dynamodb-43?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "dynamodb-43"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}