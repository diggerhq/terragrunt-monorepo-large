include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/platform/service-1/application/queue-641",
    "../../../../../../../../us-east-1/dev/finance/platform/service-2/network/route-table-519",
    "../../../../../../../../us-west-2/qa/finance/data/service-1/application/api-gateway-178",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-1/storage/rds-557",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-3/security/secrets-240",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-377?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-377"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}