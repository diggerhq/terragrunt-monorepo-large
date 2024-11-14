include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/platform/service-3/security/guardduty-35",
    "../../../../../../../../us-west-2/staging/marketing/application/service-1/application/cache-layer-268",
    "../../../../../../../../eu-west-1/dev/operations/application/service-1/network/nacl-731",
    "../../../../../../../../us-west-2/qa/finance/application/service-2/monitoring/prometheus-346",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-1/storage/efs-400",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//kms-609?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "kms-609"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}