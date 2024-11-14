include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/platform/service-3/compute/auto-scaling-938",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-2/monitoring/log-aggregation-469",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-1/monitoring/trace-collection-997",
    "../../../../../../../../us-east-1/qa/marketing/application/service-3/network/endpoint-315",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-2/security/shield-139",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fargate-93?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fargate-93"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}