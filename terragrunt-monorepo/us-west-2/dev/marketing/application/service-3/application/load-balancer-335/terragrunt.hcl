include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/platform/service-1/storage/fsx-41",
    "../../../../../../../../eu-west-1/staging/operations/data/service-1/monitoring/cloudwatch-22",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-1/application/service-mesh-602",
    "../../../../../../../../us-west-2/dev/operations/data/service-3/application/event-bus-96",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-335?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-335"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}