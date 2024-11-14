include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/application/service-2/application/cache-layer-681",
    "../../../../../../../../us-west-2/qa/marketing/data/service-3/application/event-bus-185",
    "../../../../../../../../eu-west-1/staging/operations/application/service-1/storage/rds-922",
    "../../../../../../../../eu-west-1/qa/operations/data/service-1/monitoring/prometheus-102",
    "../../../../../../../../us-west-2/staging/finance/data/service-2/monitoring/cloudwatch-839",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//prometheus-151?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "prometheus-151"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}