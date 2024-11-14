include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/application/service-2/application/cache-layer-9",
    "../../../../../../../../us-east-1/qa/marketing/application/service-1/storage/efs-398",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-2/network/nacl-944",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-3/network/nacl-149",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cloudwatch-87?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cloudwatch-87"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}