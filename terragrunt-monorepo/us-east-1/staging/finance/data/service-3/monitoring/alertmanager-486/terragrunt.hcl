include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/data/service-3/application/service-mesh-752",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-2/compute/lambda-312",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-1/application/load-balancer-869",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//alertmanager-486?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "alertmanager-486"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}