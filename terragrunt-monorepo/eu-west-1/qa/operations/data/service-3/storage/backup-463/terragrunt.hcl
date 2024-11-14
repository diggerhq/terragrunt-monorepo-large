include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/data/service-2/compute/spot-fleet-299",
    "../../../../../../../../us-west-2/staging/finance/platform/service-1/application/service-mesh-208",
    "../../../../../../../../us-east-1/qa/marketing/application/service-1/compute/auto-scaling-385",
    "../../../../../../../../us-east-1/dev/operations/platform/service-2/storage/redshift-872",
    "../../../../../../../../eu-west-1/qa/operations/application/service-1/monitoring/grafana-656",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//backup-463?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "backup-463"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}