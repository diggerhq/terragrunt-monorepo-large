include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/platform/service-2/application/queue-485",
    "../../../../../../../../eu-west-1/dev/operations/data/service-2/application/queue-99",
    "../../../../../../../../us-east-1/qa/finance/application/service-3/network/direct-connect-282",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-3/compute/lambda-981",
    "../../../../../../../../us-west-2/staging/marketing/application/service-3/compute/lambda-209",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//direct-connect-407?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "direct-connect-407"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}