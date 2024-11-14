include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/platform/service-1/security/iam-797",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-3/storage/dynamodb-887",
    "../../../../../../../../us-west-2/qa/operations/data/service-1/storage/backup-285",
    "../../../../../../../../us-west-2/dev/operations/application/service-2/network/nacl-858",
    "../../../../../../../../us-east-1/qa/operations/application/service-2/monitoring/trace-collection-804",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-169?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-169"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}