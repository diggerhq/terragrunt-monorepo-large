include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/data/service-1/compute/lambda-984",
    "../../../../../../../../eu-west-1/qa/operations/data/service-1/compute/batch-952",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-2/monitoring/trace-collection-693",
    "../../../../../../../../us-east-1/staging/marketing/data/service-2/storage/fsx-944",
    "../../../../../../../../us-east-1/staging/operations/application/service-2/network/route-table-267",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//certificates-348?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "certificates-348"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}