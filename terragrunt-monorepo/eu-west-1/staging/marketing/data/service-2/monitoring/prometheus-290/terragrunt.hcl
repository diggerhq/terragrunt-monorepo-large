include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/platform/service-3/storage/dynamodb-8",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-2/monitoring/cloudwatch-807",
    "../../../../../../../../eu-west-1/staging/operations/data/service-3/monitoring/trace-collection-784",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//prometheus-290?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "prometheus-290"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}