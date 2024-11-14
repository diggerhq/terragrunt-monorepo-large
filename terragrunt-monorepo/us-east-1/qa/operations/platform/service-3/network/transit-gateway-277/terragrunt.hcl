include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/data/service-1/network/subnet-186",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-3/storage/backup-931",
    "../../../../../../../../us-west-2/dev/operations/data/service-2/storage/rds-139",
    "../../../../../../../../us-west-2/staging/operations/data/service-1/network/direct-connect-27",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//transit-gateway-277?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "transit-gateway-277"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}