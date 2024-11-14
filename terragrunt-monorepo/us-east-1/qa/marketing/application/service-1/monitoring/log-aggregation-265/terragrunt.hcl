include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/data/service-3/compute/ecs-605",
    "../../../../../../../../us-east-1/qa/operations/platform/service-2/network/endpoint-780",
    "../../../../../../../../us-east-1/dev/operations/platform/service-1/monitoring/alertmanager-258",
    "../../../../../../../../us-east-1/qa/marketing/data/service-1/monitoring/cloudwatch-665",
    "../../../../../../../../us-west-2/dev/operations/platform/service-1/storage/elasticache-250",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-265?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-265"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}