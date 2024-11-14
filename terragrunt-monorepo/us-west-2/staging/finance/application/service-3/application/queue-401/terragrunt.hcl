include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/data/service-3/storage/elasticache-713",
    "../../../../../../../../us-west-2/qa/operations/data/service-1/security/iam-429",
    "../../../../../../../../us-east-1/staging/finance/platform/service-1/storage/dynamodb-647",
    "../../../../../../../../eu-west-1/dev/operations/application/service-1/storage/fsx-586",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-401?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-401"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}