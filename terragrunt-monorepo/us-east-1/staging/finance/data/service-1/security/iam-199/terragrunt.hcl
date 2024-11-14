include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/application/service-3/network/route-table-864",
    "../../../../../../../../us-west-2/staging/marketing/data/service-1/application/event-bus-685",
    "../../../../../../../../eu-west-1/qa/operations/data/service-3/security/waf-729",
    "../../../../../../../../eu-west-1/qa/finance/application/service-1/network/subnet-412",
    "../../../../../../../../eu-west-1/staging/operations/data/service-2/storage/rds-153",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//iam-199?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "iam-199"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}