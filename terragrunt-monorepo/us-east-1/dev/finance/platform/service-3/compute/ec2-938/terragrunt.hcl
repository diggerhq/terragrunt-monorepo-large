include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/application/service-3/monitoring/alertmanager-176",
    "../../../../../../../../us-east-1/staging/finance/application/service-2/storage/dynamodb-124",
    "../../../../../../../../us-west-2/staging/finance/data/service-1/monitoring/log-aggregation-391",
    "../../../../../../../../us-east-1/staging/marketing/data/service-1/network/endpoint-409",
    "../../../../../../../../us-east-1/qa/finance/application/service-1/network/direct-connect-238",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-938?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-938"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}