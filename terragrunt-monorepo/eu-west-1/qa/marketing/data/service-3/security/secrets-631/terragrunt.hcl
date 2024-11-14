include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/platform/service-3/application/service-mesh-192",
    "../../../../../../../../us-west-2/dev/finance/platform/service-2/storage/redshift-611",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-1/monitoring/grafana-529",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-2/application/api-gateway-487",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//secrets-631?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "secrets-631"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}