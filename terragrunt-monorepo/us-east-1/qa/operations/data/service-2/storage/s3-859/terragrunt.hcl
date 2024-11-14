include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/data/service-3/network/direct-connect-447",
    "../../../../../../../../us-west-2/staging/operations/platform/service-2/storage/backup-249",
    "../../../../../../../../us-east-1/staging/finance/platform/service-1/storage/dynamodb-647",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-1/application/queue-731",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//s3-859?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "s3-859"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}