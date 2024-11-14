include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/application/service-3/network/vpc-264",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-2/security/security-hub-507",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-3/compute/fargate-802",
    "../../../../../../../../us-west-2/qa/finance/data/service-2/monitoring/log-aggregation-668",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ecs-605?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ecs-605"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}