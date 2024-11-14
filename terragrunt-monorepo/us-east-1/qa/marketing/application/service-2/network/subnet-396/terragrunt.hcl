include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/application/service-2/network/transit-gateway-137",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-3/monitoring/prometheus-419",
    "../../../../../../../../us-east-1/qa/marketing/application/service-1/monitoring/trace-collection-363",
    "../../../../../../../../us-east-1/qa/marketing/data/service-1/storage/rds-877",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-2/compute/ecs-131",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//subnet-396?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "subnet-396"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}