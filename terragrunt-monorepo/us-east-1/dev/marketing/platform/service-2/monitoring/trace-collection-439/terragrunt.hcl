include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/data/service-3/network/vpc-237",
    "../../../../../../../../us-west-2/dev/operations/application/service-3/application/queue-119",
    "../../../../../../../../us-west-2/staging/operations/platform/service-2/storage/dynamodb-18",
    "../../../../../../../../us-west-2/dev/marketing/application/service-2/network/nacl-533",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-439?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-439"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}