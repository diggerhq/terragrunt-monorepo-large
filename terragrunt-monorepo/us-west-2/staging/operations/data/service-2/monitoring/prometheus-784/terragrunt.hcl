include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/data/service-3/storage/fsx-109",
    "../../../../../../../../us-west-2/dev/finance/data/service-1/storage/redshift-254",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-2/application/cache-layer-869",
    "../../../../../../../../us-east-1/staging/operations/application/service-1/monitoring/log-aggregation-160",
    "../../../../../../../../us-west-2/dev/marketing/data/service-3/security/certificates-597",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//prometheus-784?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "prometheus-784"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}