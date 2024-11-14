include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/platform/service-2/security/certificates-970",
    "../../../../../../../../eu-west-1/qa/finance/application/service-2/storage/backup-253",
    "../../../../../../../../us-east-1/dev/finance/data/service-1/application/load-balancer-316",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-1/network/transit-gateway-845",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//spot-fleet-891?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "spot-fleet-891"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}