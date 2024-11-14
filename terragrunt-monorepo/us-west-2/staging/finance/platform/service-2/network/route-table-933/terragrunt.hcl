include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/data/service-1/security/shield-500",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-1/compute/lambda-907",
    "../../../../../../../../us-west-2/dev/finance/application/service-3/application/load-balancer-237",
    "../../../../../../../../us-east-1/staging/finance/data/service-2/storage/dynamodb-34",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//route-table-933?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "route-table-933"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}