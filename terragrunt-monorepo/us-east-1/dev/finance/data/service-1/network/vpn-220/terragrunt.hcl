include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/platform/service-2/network/endpoint-818",
    "../../../../../../../../us-west-2/qa/finance/data/service-3/storage/efs-691",
    "../../../../../../../../us-west-2/dev/operations/application/service-2/storage/s3-969",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpn-220?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpn-220"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}