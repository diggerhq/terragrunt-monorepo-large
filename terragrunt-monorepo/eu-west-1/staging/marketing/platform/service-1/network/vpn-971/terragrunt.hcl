include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/platform/service-3/storage/backup-687",
    "../../../../../../../../us-east-1/qa/marketing/data/service-3/network/direct-connect-655",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-2/compute/auto-scaling-401",
    "../../../../../../../../us-west-2/dev/marketing/data/service-1/monitoring/log-aggregation-189",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpn-971?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpn-971"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}