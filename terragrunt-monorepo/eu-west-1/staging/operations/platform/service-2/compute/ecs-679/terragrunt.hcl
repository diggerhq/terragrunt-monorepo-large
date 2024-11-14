include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/platform/service-1/security/iam-167",
    "../../../../../../../../us-east-1/qa/finance/platform/service-2/application/event-bus-77",
    "../../../../../../../../eu-west-1/qa/finance/data/service-2/monitoring/log-aggregation-211",
    "../../../../../../../../us-west-2/staging/finance/platform/service-1/security/guardduty-879",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ecs-679?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ecs-679"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}