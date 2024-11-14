include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/data/service-2/storage/s3-208",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-3/monitoring/log-aggregation-917",
    "../../../../../../../../eu-west-1/dev/operations/application/service-1/application/service-mesh-784",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-1/monitoring/prometheus-547",
    "../../../../../../../../eu-west-1/staging/operations/application/service-1/application/cache-layer-619",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//nacl-864?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "nacl-864"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}