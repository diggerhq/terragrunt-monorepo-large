include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-2/application/event-bus-394",
    "../../../../../../../../us-east-1/qa/operations/application/service-2/compute/ec2-897",
    "../../../../../../../../eu-west-1/staging/finance/data/service-1/security/security-hub-410",
    "../../../../../../../../us-west-2/dev/finance/platform/service-3/network/nacl-92",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-1/network/endpoint-455",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//lambda-688?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "lambda-688"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}