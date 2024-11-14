include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/application/service-3/network/nacl-535",
    "../../../../../../../../eu-west-1/qa/finance/application/service-3/network/endpoint-430",
    "../../../../../../../../us-west-2/staging/operations/data/service-3/compute/auto-scaling-460",
    "../../../../../../../../eu-west-1/dev/operations/application/service-1/security/shield-962",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-2/compute/lambda-85",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ecs-120?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ecs-120"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}