include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/data/service-2/compute/batch-666",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-3/storage/elasticache-712",
    "../../../../../../../../us-east-1/qa/operations/application/service-3/monitoring/cloudwatch-235",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-3/application/queue-308",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//spot-fleet-172?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "spot-fleet-172"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}