include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/application/service-2/storage/dynamodb-124",
    "../../../../../../../../eu-west-1/qa/finance/application/service-1/compute/batch-38",
    "../../../../../../../../us-west-2/staging/operations/data/service-1/monitoring/cloudwatch-341",
    "../../../../../../../../us-west-2/dev/marketing/data/service-2/network/route-table-925",
    "../../../../../../../../us-west-2/qa/operations/application/service-3/storage/elasticache-945",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fargate-890?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fargate-890"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}