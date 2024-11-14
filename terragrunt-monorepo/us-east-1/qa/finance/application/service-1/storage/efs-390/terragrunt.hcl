include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/data/service-2/application/cache-layer-778",
    "../../../../../../../../us-east-1/staging/operations/platform/service-2/monitoring/alertmanager-719",
    "../../../../../../../../eu-west-1/dev/finance/application/service-1/application/service-mesh-926",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//efs-390?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "efs-390"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}