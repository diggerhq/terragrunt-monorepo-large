include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/platform/service-2/storage/dynamodb-835",
    "../../../../../../../../us-east-1/qa/marketing/data/service-1/network/vpn-267",
    "../../../../../../../../us-east-1/staging/operations/data/service-1/security/security-hub-860",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-3/monitoring/grafana-627",
    "../../../../../../../../us-west-2/dev/finance/data/service-2/network/vpn-411",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-384?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-384"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}