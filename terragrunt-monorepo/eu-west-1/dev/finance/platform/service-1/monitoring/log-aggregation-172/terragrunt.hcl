include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/platform/service-3/compute/ecs-614",
    "../../../../../../../../us-west-2/qa/finance/application/service-3/application/api-gateway-493",
    "../../../../../../../../eu-west-1/dev/operations/application/service-1/security/guardduty-46",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-1/storage/fsx-39",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-172?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-172"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}