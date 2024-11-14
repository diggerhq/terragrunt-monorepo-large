include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/platform/service-3/storage/s3-36",
    "../../../../../../../../us-east-1/staging/operations/application/service-3/network/subnet-958",
    "../../../../../../../../eu-west-1/qa/operations/application/service-2/application/service-mesh-219",
    "../../../../../../../../eu-west-1/staging/finance/application/service-3/application/queue-376",
    "../../../../../../../../eu-west-1/staging/finance/data/service-3/application/service-mesh-247",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//nacl-201?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "nacl-201"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}