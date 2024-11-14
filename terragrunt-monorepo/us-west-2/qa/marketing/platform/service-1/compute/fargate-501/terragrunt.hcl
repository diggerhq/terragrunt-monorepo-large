include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/platform/service-1/security/shield-943",
    "../../../../../../../../eu-west-1/dev/operations/application/service-1/network/endpoint-708",
    "../../../../../../../../us-east-1/qa/finance/platform/service-3/security/shield-662",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-3/security/security-hub-154",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fargate-501?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fargate-501"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}