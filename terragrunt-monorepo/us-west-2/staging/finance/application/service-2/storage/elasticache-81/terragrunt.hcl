include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/platform/service-2/network/vpn-946",
    "../../../../../../../../us-east-1/staging/operations/platform/service-3/monitoring/grafana-683",
    "../../../../../../../../us-west-2/qa/finance/platform/service-1/security/shield-943",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//elasticache-81?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "elasticache-81"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}