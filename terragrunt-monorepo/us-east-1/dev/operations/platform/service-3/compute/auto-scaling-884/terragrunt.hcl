include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/data/service-3/compute/fargate-298",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-1/application/api-gateway-616",
    "../../../../../../../../us-east-1/staging/operations/application/service-3/security/guardduty-581",
    "../../../../../../../../eu-west-1/qa/operations/application/service-1/application/load-balancer-213",
    "../../../../../../../../eu-west-1/dev/operations/application/service-3/monitoring/trace-collection-953",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-884?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-884"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}