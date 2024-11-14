include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/data/service-3/compute/ecs-605",
    "../../../../../../../../eu-west-1/dev/operations/application/service-2/network/direct-connect-672",
    "../../../../../../../../us-east-1/dev/finance/data/service-2/application/load-balancer-803",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-3/security/certificates-196",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-3/security/iam-955",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//api-gateway-226?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "api-gateway-226"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}