include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/data/service-1/application/load-balancer-398",
    "../../../../../../../../us-west-2/dev/operations/platform/service-1/monitoring/trace-collection-149",
    "../../../../../../../../us-east-1/qa/finance/platform/service-2/monitoring/cloudwatch-340",
    "../../../../../../../../us-west-2/qa/finance/application/service-3/network/nacl-864",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-3/storage/fsx-795",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-686?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-686"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}