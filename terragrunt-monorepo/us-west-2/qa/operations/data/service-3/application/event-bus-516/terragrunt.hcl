include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/application/service-1/monitoring/cloudwatch-600",
    "../../../../../../../../us-west-2/dev/operations/data/service-1/application/cache-layer-904",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-1/security/shield-383",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-516?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-516"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}