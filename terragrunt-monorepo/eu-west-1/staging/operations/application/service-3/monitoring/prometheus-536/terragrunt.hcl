include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/application/service-3/compute/spot-fleet-891",
    "../../../../../../../../us-east-1/dev/finance/data/service-1/network/endpoint-324",
    "../../../../../../../../us-east-1/dev/operations/data/service-3/monitoring/log-aggregation-40",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//prometheus-536?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "prometheus-536"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}