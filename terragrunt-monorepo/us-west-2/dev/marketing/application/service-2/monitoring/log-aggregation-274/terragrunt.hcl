include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/application/service-2/application/api-gateway-625",
    "../../../../../../../../eu-west-1/qa/operations/data/service-2/monitoring/log-aggregation-956",
    "../../../../../../../../us-west-2/staging/finance/data/service-1/monitoring/log-aggregation-391",
    "../../../../../../../../us-west-2/staging/marketing/data/service-3/network/direct-connect-386",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-2/storage/backup-917",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-274?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-274"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}