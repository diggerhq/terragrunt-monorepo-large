include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/data/service-2/compute/spot-fleet-43",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-2/storage/dynamodb-356",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-3/network/nacl-594",
    "../../../../../../../../us-west-2/dev/marketing/application/service-3/application/cache-layer-730",
    "../../../../../../../../us-west-2/dev/marketing/data/service-1/application/load-balancer-476",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-819?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-819"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}