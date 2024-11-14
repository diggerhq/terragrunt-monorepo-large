include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/application/service-2/storage/efs-196",
    "../../../../../../../../eu-west-1/qa/finance/data/service-1/network/direct-connect-354",
    "../../../../../../../../us-east-1/dev/marketing/data/service-1/application/service-mesh-750",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//redshift-687?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "redshift-687"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}