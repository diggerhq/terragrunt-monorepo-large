include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/platform/service-3/security/secrets-608",
    "../../../../../../../../us-east-1/staging/operations/platform/service-1/compute/auto-scaling-191",
    "../../../../../../../../us-east-1/qa/finance/data/service-2/application/service-mesh-982",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-2/network/endpoint-698",
    "../../../../../../../../us-east-1/dev/operations/application/service-1/monitoring/alertmanager-214",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//spot-fleet-713?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "spot-fleet-713"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}