include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/application/service-1/network/transit-gateway-179",
    "../../../../../../../../eu-west-1/staging/finance/data/service-2/storage/backup-761",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-3/application/queue-787",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-1/network/endpoint-806",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-1/application/queue-348",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//spot-fleet-915?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "spot-fleet-915"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}