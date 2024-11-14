include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/platform/service-3/security/waf-806",
    "../../../../../../../../us-west-2/qa/finance/platform/service-3/compute/auto-scaling-611",
    "../../../../../../../../us-west-2/qa/finance/platform/service-3/network/subnet-272",
    "../../../../../../../../eu-west-1/staging/finance/application/service-1/storage/dynamodb-131",
    "../../../../../../../../us-west-2/staging/marketing/application/service-3/compute/lambda-209",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//security-hub-913?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "security-hub-913"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}