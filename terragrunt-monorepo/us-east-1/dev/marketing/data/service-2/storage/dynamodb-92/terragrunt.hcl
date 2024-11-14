include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/platform/service-1/application/load-balancer-5",
    "../../../../../../../../us-east-1/dev/marketing/application/service-1/security/guardduty-801",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-3/security/security-hub-828",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-3/compute/ecs-659",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//dynamodb-92?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "dynamodb-92"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}