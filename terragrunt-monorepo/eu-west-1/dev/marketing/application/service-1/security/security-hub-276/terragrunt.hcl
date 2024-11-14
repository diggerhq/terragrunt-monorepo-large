include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/data/service-2/storage/efs-120",
    "../../../../../../../../eu-west-1/qa/finance/application/service-3/network/vpn-867",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-3/application/queue-900",
    "../../../../../../../../us-west-2/staging/operations/platform/service-3/network/subnet-382",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-1/monitoring/trace-collection-618",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//security-hub-276?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "security-hub-276"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}