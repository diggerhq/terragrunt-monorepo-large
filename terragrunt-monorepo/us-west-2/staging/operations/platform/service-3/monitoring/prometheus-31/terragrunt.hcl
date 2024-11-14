include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/platform/service-2/security/secrets-964",
    "../../../../../../../../us-west-2/dev/finance/application/service-2/monitoring/alertmanager-560",
    "../../../../../../../../eu-west-1/staging/finance/application/service-2/application/service-mesh-728",
    "../../../../../../../../us-east-1/qa/finance/data/service-3/network/vpn-477",
    "../../../../../../../../eu-west-1/staging/operations/data/service-1/storage/s3-842",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//prometheus-31?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "prometheus-31"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}