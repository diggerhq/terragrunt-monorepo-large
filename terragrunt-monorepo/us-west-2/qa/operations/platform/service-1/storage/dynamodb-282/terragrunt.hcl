include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/data/service-2/compute/batch-624",
    "../../../../../../../../us-west-2/dev/operations/data/service-1/security/kms-457",
    "../../../../../../../../us-west-2/qa/marketing/data/service-2/compute/auto-scaling-971",
    "../../../../../../../../eu-west-1/dev/operations/data/service-1/compute/fargate-608",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//dynamodb-282?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "dynamodb-282"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}