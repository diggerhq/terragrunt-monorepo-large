include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/data/service-3/compute/ecs-618",
    "../../../../../../../../eu-west-1/dev/finance/application/service-1/storage/s3-576",
    "../../../../../../../../us-east-1/qa/operations/data/service-3/compute/batch-562",
    "../../../../../../../../eu-west-1/staging/finance/application/service-1/application/load-balancer-460",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//dynamodb-553?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "dynamodb-553"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}