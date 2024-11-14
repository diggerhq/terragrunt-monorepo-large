include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/platform/service-3/security/iam-926",
    "../../../../../../../../eu-west-1/dev/finance/application/service-1/storage/fsx-192",
    "../../../../../../../../us-west-2/qa/operations/data/service-1/storage/backup-285",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-1/monitoring/log-aggregation-172",
    "../../../../../../../../us-west-2/staging/operations/data/service-2/monitoring/prometheus-784",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//certificates-263?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "certificates-263"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}