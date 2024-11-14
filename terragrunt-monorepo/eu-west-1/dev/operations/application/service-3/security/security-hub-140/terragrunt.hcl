include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/application/load-balancer-598",
    "../../../../../../../../us-west-2/staging/operations/platform/service-2/monitoring/prometheus-282",
    "../../../../../../../../us-west-2/qa/operations/application/service-1/storage/fsx-403",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-2/application/cache-layer-897",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//security-hub-140?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "security-hub-140"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}