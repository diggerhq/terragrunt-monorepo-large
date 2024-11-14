include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/application/service-3/network/nacl-466",
    "../../../../../../../../us-east-1/qa/finance/application/service-2/network/route-table-767",
    "../../../../../../../../us-west-2/qa/finance/platform/service-3/network/endpoint-776",
    "../../../../../../../../us-west-2/dev/operations/data/service-3/storage/efs-270",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//elasticache-853?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "elasticache-853"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}