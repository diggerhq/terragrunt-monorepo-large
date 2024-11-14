include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/data/service-1/network/endpoint-255",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-2/network/subnet-79",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-3/storage/efs-758",
    "../../../../../../../../us-west-2/dev/finance/application/service-1/monitoring/grafana-937",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-798?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-798"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}