include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/data/service-2/security/certificates-378",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-3/compute/ecs-612",
    "../../../../../../../../us-west-2/qa/finance/application/service-1/compute/lambda-941",
    "../../../../../../../../us-west-2/dev/operations/data/service-2/storage/rds-139",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-815?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-815"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}