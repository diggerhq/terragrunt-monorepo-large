include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/application/service-2/application/queue-914",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-2/compute/lambda-459",
    "../../../../../../../../eu-west-1/dev/finance/data/service-3/network/subnet-647",
    "../../../../../../../../us-east-1/staging/finance/platform/service-1/compute/ec2-851",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//lambda-532?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "lambda-532"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}