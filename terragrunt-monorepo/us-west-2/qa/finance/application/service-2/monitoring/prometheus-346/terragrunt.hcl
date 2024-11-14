include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/application/service-1/monitoring/grafana-898",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-3/monitoring/grafana-181",
    "../../../../../../../../us-east-1/staging/operations/data/service-3/storage/dynamodb-956",
    "../../../../../../../../us-east-1/staging/operations/platform/service-2/application/event-bus-108",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//prometheus-346?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "prometheus-346"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}