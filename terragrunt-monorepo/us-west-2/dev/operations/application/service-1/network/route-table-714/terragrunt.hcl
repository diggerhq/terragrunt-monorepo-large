include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/platform/service-3/application/queue-209",
    "../../../../../../../../us-east-1/staging/finance/data/service-1/storage/efs-485",
    "../../../../../../../../us-west-2/qa/finance/application/service-3/network/endpoint-358",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-1/security/shield-952",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-3/storage/backup-145",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//route-table-714?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "route-table-714"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}