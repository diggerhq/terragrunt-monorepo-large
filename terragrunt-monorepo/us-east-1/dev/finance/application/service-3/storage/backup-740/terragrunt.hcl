include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/data/service-3/compute/ecs-89",
    "../../../../../../../../us-west-2/qa/operations/platform/service-2/compute/batch-878",
    "../../../../../../../../eu-west-1/dev/finance/data/service-1/network/transit-gateway-338",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-1/application/queue-731",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-3/monitoring/trace-collection-203",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//backup-740?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "backup-740"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}