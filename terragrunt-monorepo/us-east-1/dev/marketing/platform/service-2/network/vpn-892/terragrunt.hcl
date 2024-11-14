include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/application/service-3/monitoring/prometheus-397",
    "../../../../../../../../us-west-2/qa/operations/data/service-2/security/iam-671",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-1/network/route-table-225",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-3/storage/dynamodb-57",
    "../../../../../../../../us-west-2/qa/marketing/application/service-2/monitoring/grafana-300",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpn-892?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpn-892"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}