include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/application/service-3/application/load-balancer-841",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-3/application/queue-976",
    "../../../../../../../../eu-west-1/qa/operations/data/service-3/application/cache-layer-440",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-3/storage/fsx-417",
    "../../../../../../../../us-east-1/qa/finance/application/service-3/compute/auto-scaling-587",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//dynamodb-956?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "dynamodb-956"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}