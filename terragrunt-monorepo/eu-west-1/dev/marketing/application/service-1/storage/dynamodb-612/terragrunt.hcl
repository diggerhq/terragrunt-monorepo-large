include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/data/service-2/compute/fargate-726",
    "../../../../../../../../us-east-1/staging/finance/data/service-1/storage/efs-485",
    "../../../../../../../../us-west-2/staging/finance/data/service-3/security/guardduty-5",
    "../../../../../../../../us-west-2/dev/finance/data/service-1/network/direct-connect-637",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//dynamodb-612?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "dynamodb-612"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}