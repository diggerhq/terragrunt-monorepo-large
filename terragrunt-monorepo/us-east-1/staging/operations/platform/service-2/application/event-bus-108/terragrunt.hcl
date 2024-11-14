include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/application/service-2/network/vpc-242",
    "../../../../../../../../us-east-1/qa/finance/platform/service-1/application/service-mesh-506",
    "../../../../../../../../us-east-1/qa/marketing/application/service-1/network/nacl-289",
    "../../../../../../../../us-east-1/dev/finance/platform/service-1/storage/rds-279",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-108?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-108"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}