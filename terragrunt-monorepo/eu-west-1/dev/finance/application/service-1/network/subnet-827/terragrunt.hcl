include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/data/service-1/monitoring/log-aggregation-511",
    "../../../../../../../../us-west-2/staging/operations/application/service-1/monitoring/prometheus-576",
    "../../../../../../../../us-west-2/staging/operations/application/service-1/compute/lambda-237",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-2/security/shield-94",
    "../../../../../../../../eu-west-1/dev/finance/application/service-2/monitoring/trace-collection-750",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//subnet-827?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "subnet-827"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}