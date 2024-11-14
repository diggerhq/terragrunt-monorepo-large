include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/platform/service-1/monitoring/alertmanager-36",
    "../../../../../../../../us-east-1/dev/operations/platform/service-2/compute/ecs-977",
    "../../../../../../../../eu-west-1/qa/operations/data/service-3/storage/s3-746",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-1/storage/elasticache-869",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-2/storage/s3-210",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//batch-208?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "batch-208"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}