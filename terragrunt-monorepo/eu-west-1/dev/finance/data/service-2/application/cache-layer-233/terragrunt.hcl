include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/application/service-3/monitoring/trace-collection-377",
    "../../../../../../../../us-east-1/staging/operations/application/service-3/storage/redshift-485",
    "../../../../../../../../us-west-2/qa/finance/application/service-1/security/certificates-175",
    "../../../../../../../../us-east-1/dev/operations/platform/service-1/monitoring/prometheus-945",
    "../../../../../../../../us-west-2/qa/finance/platform/service-1/application/cache-layer-871",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-233?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-233"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}