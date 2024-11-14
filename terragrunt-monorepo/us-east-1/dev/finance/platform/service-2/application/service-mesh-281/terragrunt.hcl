include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/data/service-2/compute/auto-scaling-971",
    "../../../../../../../../us-east-1/qa/marketing/application/service-3/storage/s3-1",
    "../../../../../../../../us-east-1/dev/operations/application/service-3/monitoring/log-aggregation-585",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-281?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-281"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}