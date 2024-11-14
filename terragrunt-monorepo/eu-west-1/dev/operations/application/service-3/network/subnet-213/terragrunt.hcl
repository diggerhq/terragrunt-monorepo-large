include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/application/service-1/compute/spot-fleet-637",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-3/monitoring/log-aggregation-501",
    "../../../../../../../../eu-west-1/staging/operations/application/service-1/monitoring/grafana-898",
    "../../../../../../../../us-west-2/dev/finance/platform/service-3/application/queue-188",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//subnet-213?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "subnet-213"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}