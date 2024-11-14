include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/application/service-1/network/vpc-431",
    "../../../../../../../../us-east-1/qa/marketing/application/service-1/monitoring/log-aggregation-265",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-1/storage/backup-353",
    "../../../../../../../../us-east-1/staging/finance/data/service-2/security/security-hub-714",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpn-867?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpn-867"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}