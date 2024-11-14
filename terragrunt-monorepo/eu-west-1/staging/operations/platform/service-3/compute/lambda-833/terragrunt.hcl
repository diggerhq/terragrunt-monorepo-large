include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/platform/service-1/application/service-mesh-980",
    "../../../../../../../../eu-west-1/staging/operations/application/service-1/storage/dynamodb-829",
    "../../../../../../../../eu-west-1/dev/operations/application/service-2/security/guardduty-898",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//lambda-833?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "lambda-833"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}