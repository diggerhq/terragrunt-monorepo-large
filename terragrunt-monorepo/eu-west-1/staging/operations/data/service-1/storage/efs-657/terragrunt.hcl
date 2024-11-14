include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/application/service-3/storage/efs-395",
    "../../../../../../../../us-east-1/dev/operations/platform/service-2/compute/ecs-469",
    "../../../../../../../../us-east-1/qa/operations/data/service-2/monitoring/log-aggregation-295",
    "../../../../../../../../us-west-2/staging/marketing/data/service-2/application/cache-layer-70",
    "../../../../../../../../us-west-2/dev/finance/platform/service-2/monitoring/cloudwatch-926",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//efs-657?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "efs-657"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}