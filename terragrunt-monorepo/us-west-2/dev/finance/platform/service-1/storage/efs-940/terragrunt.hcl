include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/application/service-1/compute/lambda-290",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-2/monitoring/prometheus-576",
    "../../../../../../../../us-east-1/staging/operations/platform/service-2/storage/dynamodb-82",
    "../../../../../../../../us-west-2/dev/marketing/application/service-3/network/endpoint-104",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//efs-940?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "efs-940"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}