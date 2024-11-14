include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/application/service-3/application/api-gateway-550",
    "../../../../../../../../us-east-1/qa/marketing/application/service-3/compute/fargate-439",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-3/security/kms-556",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-2/network/subnet-938",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-256?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-256"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}