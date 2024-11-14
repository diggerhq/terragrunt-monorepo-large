include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/platform/service-1/application/load-balancer-869",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-2/network/transit-gateway-942",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-3/storage/backup-752",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//guardduty-703?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "guardduty-703"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}