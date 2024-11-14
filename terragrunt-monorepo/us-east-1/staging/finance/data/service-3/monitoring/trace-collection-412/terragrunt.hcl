include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/application/service-3/application/load-balancer-465",
    "../../../../../../../../eu-west-1/qa/finance/application/service-2/compute/lambda-135",
    "../../../../../../../../us-east-1/qa/finance/application/service-1/security/certificates-773",
    "../../../../../../../../us-east-1/dev/operations/platform/service-1/compute/spot-fleet-915",
    "../../../../../../../../us-west-2/dev/finance/application/service-2/compute/spot-fleet-105",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-412?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-412"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}