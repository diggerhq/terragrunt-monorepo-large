include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/data/service-3/security/certificates-703",
    "../../../../../../../../us-east-1/qa/operations/application/service-3/storage/dynamodb-535",
    "../../../../../../../../us-east-1/staging/finance/application/service-2/application/event-bus-549",
    "../../../../../../../../us-east-1/staging/operations/platform/service-2/monitoring/cloudwatch-990",
    "../../../../../../../../us-east-1/qa/finance/platform/service-2/monitoring/log-aggregation-740",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//elasticache-723?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "elasticache-723"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}