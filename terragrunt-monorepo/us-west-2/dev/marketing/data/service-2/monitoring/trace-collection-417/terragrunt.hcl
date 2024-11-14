include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/application/service-2/storage/fsx-160",
    "../../../../../../../../us-east-1/staging/marketing/application/service-3/monitoring/trace-collection-644",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-1/monitoring/alertmanager-732",
    "../../../../../../../../us-west-2/staging/operations/data/service-3/storage/dynamodb-56",
    "../../../../../../../../us-west-2/qa/finance/application/service-2/network/transit-gateway-137",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-417?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-417"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}