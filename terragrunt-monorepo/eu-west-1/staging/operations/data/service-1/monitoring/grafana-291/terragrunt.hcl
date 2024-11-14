include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/data/service-3/application/api-gateway-811",
    "../../../../../../../../us-west-2/qa/finance/data/service-2/application/service-mesh-799",
    "../../../../../../../../eu-west-1/qa/operations/data/service-3/application/api-gateway-375",
    "../../../../../../../../us-west-2/qa/marketing/data/service-1/application/api-gateway-31",
    "../../../../../../../../eu-west-1/dev/finance/data/service-2/network/vpn-350",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-291?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-291"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}