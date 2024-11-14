include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/data/service-2/monitoring/trace-collection-819",
    "../../../../../../../../us-west-2/qa/operations/data/service-3/monitoring/grafana-968",
    "../../../../../../../../us-west-2/staging/operations/data/service-2/application/cache-layer-778",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-1/monitoring/trace-collection-95",
    "../../../../../../../../eu-west-1/staging/finance/data/service-3/storage/fsx-552",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//batch-547?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "batch-547"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}