include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/platform/service-2/application/event-bus-256",
    "../../../../../../../../us-west-2/staging/finance/application/service-3/storage/rds-306",
    "../../../../../../../../us-east-1/staging/marketing/application/service-3/monitoring/trace-collection-905",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-1/monitoring/grafana-584",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-533?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-533"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}