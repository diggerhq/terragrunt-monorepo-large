include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/application/service-2/monitoring/trace-collection-804",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-1/storage/efs-894",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-2/network/vpc-131",
    "../../../../../../../../us-east-1/qa/operations/data/service-3/monitoring/trace-collection-769",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//route-table-730?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "route-table-730"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}