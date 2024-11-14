include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/application/service-3/storage/elasticache-229",
    "../../../../../../../../us-east-1/qa/finance/platform/service-3/compute/fargate-602",
    "../../../../../../../../us-west-2/staging/operations/data/service-3/compute/auto-scaling-460",
    "../../../../../../../../us-east-1/dev/finance/platform/service-1/network/nacl-586",
    "../../../../../../../../us-east-1/dev/operations/application/service-1/monitoring/prometheus-487",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//guardduty-34?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "guardduty-34"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}