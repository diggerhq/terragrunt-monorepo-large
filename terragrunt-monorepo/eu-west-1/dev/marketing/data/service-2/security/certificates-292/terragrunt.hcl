include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/application/service-3/application/event-bus-173",
    "../../../../../../../../us-east-1/dev/finance/application/service-2/storage/dynamodb-590",
    "../../../../../../../../us-east-1/qa/marketing/application/service-1/storage/efs-398",
    "../../../../../../../../us-west-2/staging/finance/application/service-1/monitoring/cloudwatch-958",
    "../../../../../../../../us-east-1/staging/finance/platform/service-1/network/direct-connect-651",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//certificates-292?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "certificates-292"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}