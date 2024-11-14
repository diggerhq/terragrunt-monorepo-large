include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/data/service-3/security/iam-218",
    "../../../../../../../../us-west-2/qa/operations/data/service-2/network/subnet-289",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-3/application/cache-layer-924",
    "../../../../../../../../us-east-1/staging/finance/platform/service-1/network/direct-connect-651",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-3/storage/fsx-548",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//direct-connect-51?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "direct-connect-51"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}