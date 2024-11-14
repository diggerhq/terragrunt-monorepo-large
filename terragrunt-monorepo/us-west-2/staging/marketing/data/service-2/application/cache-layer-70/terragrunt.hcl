include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/platform/service-1/application/queue-823",
    "../../../../../../../../us-west-2/dev/operations/data/service-3/compute/fargate-531",
    "../../../../../../../../us-east-1/qa/operations/application/service-2/application/queue-315",
    "../../../../../../../../us-east-1/dev/finance/platform/service-2/security/shield-877",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-70?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-70"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}