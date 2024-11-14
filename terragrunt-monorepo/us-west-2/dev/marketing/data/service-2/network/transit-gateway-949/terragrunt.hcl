include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/data/service-1/compute/lambda-300",
    "../../../../../../../../us-west-2/dev/finance/data/service-3/storage/rds-197",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-3/monitoring/trace-collection-407",
    "../../../../../../../../us-west-2/staging/finance/platform/service-2/application/queue-1",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//transit-gateway-949?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "transit-gateway-949"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}