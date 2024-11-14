include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/data/service-3/monitoring/trace-collection-769",
    "../../../../../../../../us-east-1/dev/marketing/data/service-1/storage/backup-620",
    "../../../../../../../../us-west-2/qa/finance/application/service-3/monitoring/log-aggregation-636",
    "../../../../../../../../us-west-2/qa/marketing/application/service-2/application/api-gateway-671",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-1/compute/fargate-19",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//lambda-46?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "lambda-46"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}