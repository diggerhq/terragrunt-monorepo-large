include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/data/service-1/storage/backup-335",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-3/storage/dynamodb-875",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-3/compute/batch-130",
    "../../../../../../../../us-west-2/staging/operations/data/service-1/compute/batch-885",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-2/network/subnet-260",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fsx-624?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fsx-624"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}