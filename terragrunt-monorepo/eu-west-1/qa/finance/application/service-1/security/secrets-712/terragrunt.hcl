include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/platform/service-1/application/service-mesh-845",
    "../../../../../../../../us-west-2/qa/marketing/application/service-3/compute/auto-scaling-123",
    "../../../../../../../../us-east-1/qa/operations/data/service-1/application/event-bus-153",
    "../../../../../../../../us-west-2/staging/marketing/application/service-3/compute/ec2-797",
    "../../../../../../../../us-west-2/dev/finance/application/service-1/network/vpn-960",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//secrets-712?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "secrets-712"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}