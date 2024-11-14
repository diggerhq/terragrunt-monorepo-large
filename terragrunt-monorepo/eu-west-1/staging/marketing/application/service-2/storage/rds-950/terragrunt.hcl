include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/data/service-3/application/event-bus-904",
    "../../../../../../../../us-east-1/dev/finance/data/service-3/compute/spot-fleet-387",
    "../../../../../../../../us-west-2/qa/operations/data/service-2/security/iam-671",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-2/storage/dynamodb-446",
    "../../../../../../../../us-west-2/staging/marketing/data/service-1/monitoring/prometheus-536",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//rds-950?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "rds-950"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}