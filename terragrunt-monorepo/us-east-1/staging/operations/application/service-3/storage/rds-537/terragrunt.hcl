include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/application/service-2/monitoring/cloudwatch-168",
    "../../../../../../../../us-west-2/qa/operations/platform/service-1/application/service-mesh-879",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-1/storage/fsx-860",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//rds-537?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "rds-537"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}