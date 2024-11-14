include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/platform/service-2/network/nacl-550",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-3/security/guardduty-912",
    "../../../../../../../../eu-west-1/dev/operations/data/service-3/application/load-balancer-395",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-2/network/endpoint-253",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-2/storage/backup-652",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-596?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-596"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}