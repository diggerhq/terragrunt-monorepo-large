include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/platform/service-3/storage/backup-687",
    "../../../../../../../../eu-west-1/dev/finance/data/service-1/security/certificates-46",
    "../../../../../../../../us-east-1/dev/finance/application/service-3/application/load-balancer-585",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-2/network/vpn-417",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//rds-401?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "rds-401"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}