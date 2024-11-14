include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/data/service-1/monitoring/prometheus-555",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-2/network/transit-gateway-772",
    "../../../../../../../../us-east-1/dev/finance/data/service-2/application/api-gateway-602",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//dynamodb-409?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "dynamodb-409"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}