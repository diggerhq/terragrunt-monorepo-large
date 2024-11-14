include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/application/service-1/compute/auto-scaling-407",
    "../../../../../../../../us-west-2/qa/finance/data/service-2/compute/fargate-962",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-1/monitoring/prometheus-749",
    "../../../../../../../../us-east-1/qa/finance/data/service-1/storage/elasticache-860",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-648?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-648"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}