include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/platform/service-2/security/guardduty-939",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-1/compute/ecs-606",
    "../../../../../../../../us-east-1/qa/operations/application/service-1/application/event-bus-578",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//elasticache-250?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "elasticache-250"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}