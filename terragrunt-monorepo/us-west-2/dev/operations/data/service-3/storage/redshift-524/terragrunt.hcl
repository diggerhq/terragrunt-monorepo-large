include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/platform/service-2/monitoring/log-aggregation-497",
    "../../../../../../../../us-east-1/staging/marketing/application/service-3/application/load-balancer-985",
    "../../../../../../../../us-east-1/staging/marketing/data/service-2/monitoring/trace-collection-777",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//redshift-524?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "redshift-524"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}