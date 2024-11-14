include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/application/service-3/application/event-bus-334",
    "../../../../../../../../eu-west-1/qa/finance/application/service-3/network/vpn-867",
    "../../../../../../../../us-east-1/dev/marketing/data/service-3/application/queue-782",
    "../../../../../../../../eu-west-1/qa/operations/application/service-3/storage/dynamodb-115",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-1/monitoring/prometheus-516",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//rds-643?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "rds-643"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}