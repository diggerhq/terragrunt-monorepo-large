include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/application/service-2/network/endpoint-687",
    "../../../../../../../../us-east-1/staging/marketing/data/service-3/network/route-table-354",
    "../../../../../../../../eu-west-1/staging/finance/data/service-2/application/api-gateway-126",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//redshift-822?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "redshift-822"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}