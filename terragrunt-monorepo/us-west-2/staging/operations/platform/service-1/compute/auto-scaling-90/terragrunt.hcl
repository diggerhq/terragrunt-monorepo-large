include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/application/service-1/network/endpoint-47",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-1/network/transit-gateway-293",
    "../../../../../../../../us-west-2/qa/finance/application/service-3/storage/rds-666",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-2/storage/dynamodb-222",
    "../../../../../../../../us-east-1/staging/marketing/data/service-1/compute/spot-fleet-128",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-90?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-90"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}