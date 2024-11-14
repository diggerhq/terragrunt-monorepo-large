include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/platform/service-1/network/transit-gateway-455",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-1/monitoring/cloudwatch-112",
    "../../../../../../../../us-west-2/dev/operations/data/service-2/compute/auto-scaling-75",
    "../../../../../../../../eu-west-1/staging/operations/data/service-1/monitoring/prometheus-86",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-1/application/queue-843",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//secrets-230?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "secrets-230"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}