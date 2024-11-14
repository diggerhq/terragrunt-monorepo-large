include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/application/service-1/compute/spot-fleet-13",
    "../../../../../../../../eu-west-1/staging/operations/data/service-3/network/endpoint-707",
    "../../../../../../../../us-east-1/qa/finance/application/service-2/storage/backup-350",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-1/application/event-bus-151",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-163?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-163"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}