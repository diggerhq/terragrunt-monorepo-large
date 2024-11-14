include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/application/service-1/storage/backup-527",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-2/network/endpoint-651",
    "../../../../../../../../eu-west-1/qa/operations/application/service-2/application/service-mesh-219",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpn-256?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpn-256"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}