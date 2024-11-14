include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/data/service-2/application/api-gateway-602",
    "../../../../../../../../eu-west-1/staging/operations/data/service-2/storage/backup-991",
    "../../../../../../../../us-west-2/staging/marketing/data/service-1/monitoring/cloudwatch-208",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fsx-203?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fsx-203"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}