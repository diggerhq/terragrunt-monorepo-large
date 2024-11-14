include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/data/service-3/monitoring/prometheus-303",
    "../../../../../../../../us-west-2/qa/operations/application/service-2/monitoring/trace-collection-251",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-1/storage/s3-93",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-573?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-573"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}