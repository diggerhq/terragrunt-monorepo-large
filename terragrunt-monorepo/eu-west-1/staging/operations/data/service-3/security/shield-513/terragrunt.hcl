include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-1/network/nacl-868",
    "../../../../../../../../us-east-1/qa/finance/platform/service-1/monitoring/trace-collection-493",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-2/application/event-bus-819",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-2/compute/ec2-29",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-1/compute/auto-scaling-7",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//shield-513?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "shield-513"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}