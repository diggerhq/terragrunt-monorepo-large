include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/data/service-1/storage/dynamodb-125",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-2/compute/fargate-944",
    "../../../../../../../../us-west-2/dev/marketing/application/service-1/storage/backup-527",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-3/storage/dynamodb-875",
    "../../../../../../../../us-west-2/staging/marketing/application/service-3/network/direct-connect-763",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpc-438?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpc-438"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}