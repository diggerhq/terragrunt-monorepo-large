include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/data/service-1/storage/fsx-407",
    "../../../../../../../../eu-west-1/qa/finance/data/service-3/monitoring/trace-collection-86",
    "../../../../../../../../eu-west-1/dev/operations/application/service-1/application/service-mesh-784",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-2/application/service-mesh-268",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//subnet-798?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "subnet-798"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}