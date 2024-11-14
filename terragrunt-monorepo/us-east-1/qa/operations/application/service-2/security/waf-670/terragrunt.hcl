include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/application/service-2/compute/ecs-656",
    "../../../../../../../../us-east-1/dev/operations/platform/service-1/security/iam-85",
    "../../../../../../../../eu-west-1/staging/finance/application/service-3/security/shield-23",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-2/network/transit-gateway-772",
    "../../../../../../../../us-west-2/qa/finance/application/service-3/security/iam-231",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//waf-670?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "waf-670"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}