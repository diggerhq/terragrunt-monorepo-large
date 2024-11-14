include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/data/service-1/application/cache-layer-107",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-2/network/nacl-944",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-3/network/route-table-782",
    "../../../../../../../../us-east-1/qa/finance/data/service-1/network/endpoint-153",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//backup-846?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "backup-846"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}