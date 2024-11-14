include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/application/service-1/compute/lambda-679",
    "../../../../../../../../us-west-2/dev/finance/application/service-2/network/subnet-990",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-2/network/transit-gateway-772",
    "../../../../../../../../us-east-1/staging/finance/platform/service-2/application/queue-163",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-1/monitoring/prometheus-516",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-282?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-282"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}