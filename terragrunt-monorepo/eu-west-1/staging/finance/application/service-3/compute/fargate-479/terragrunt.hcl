include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/application/service-3/application/event-bus-118",
    "../../../../../../../../us-east-1/qa/marketing/data/service-3/monitoring/trace-collection-837",
    "../../../../../../../../us-east-1/staging/marketing/data/service-3/monitoring/prometheus-49",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fargate-479?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fargate-479"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}