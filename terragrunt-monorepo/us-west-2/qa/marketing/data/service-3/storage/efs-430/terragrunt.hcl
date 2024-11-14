include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/data/service-2/monitoring/log-aggregation-211",
    "../../../../../../../../eu-west-1/dev/finance/application/service-3/storage/elasticache-810",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-2/monitoring/trace-collection-693",
    "../../../../../../../../us-east-1/dev/operations/data/service-1/compute/spot-fleet-136",
    "../../../../../../../../us-east-1/dev/finance/application/service-1/monitoring/prometheus-391",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//efs-430?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "efs-430"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}