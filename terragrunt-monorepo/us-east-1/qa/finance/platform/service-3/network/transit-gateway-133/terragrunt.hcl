include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/application/service-2/compute/batch-52",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-3/monitoring/alertmanager-254",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-1/storage/dynamodb-829",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//transit-gateway-133?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "transit-gateway-133"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}