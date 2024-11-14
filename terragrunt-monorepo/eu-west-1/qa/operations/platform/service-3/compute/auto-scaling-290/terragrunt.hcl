include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/application/service-1/storage/efs-444",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-3/security/guardduty-417",
    "../../../../../../../../us-east-1/staging/operations/application/service-2/monitoring/grafana-773",
    "../../../../../../../../us-west-2/dev/finance/application/service-2/compute/spot-fleet-105",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-290?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-290"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}