include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/platform/service-2/storage/dynamodb-835",
    "../../../../../../../../us-east-1/qa/finance/application/service-3/storage/fsx-902",
    "../../../../../../../../us-east-1/staging/marketing/data/service-3/network/subnet-440",
    "../../../../../../../../us-east-1/dev/marketing/data/service-1/security/waf-923",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//dynamodb-34?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "dynamodb-34"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}