include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/application/service-3/compute/batch-855",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-2/storage/dynamodb-28",
    "../../../../../../../../eu-west-1/staging/operations/data/service-2/storage/rds-153",
    "../../../../../../../../us-east-1/qa/operations/application/service-1/application/queue-320",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-442?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-442"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}