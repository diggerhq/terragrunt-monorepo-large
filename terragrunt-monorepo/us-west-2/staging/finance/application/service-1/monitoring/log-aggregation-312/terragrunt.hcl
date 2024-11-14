include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/data/service-1/network/route-table-806",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-2/security/iam-170",
    "../../../../../../../../us-west-2/dev/finance/data/service-3/monitoring/alertmanager-817",
    "../../../../../../../../us-east-1/staging/operations/platform/service-3/network/direct-connect-795",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-3/network/route-table-927",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-312?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-312"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}