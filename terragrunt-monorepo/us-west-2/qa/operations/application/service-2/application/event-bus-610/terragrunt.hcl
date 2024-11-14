include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/platform/service-2/network/vpc-409",
    "../../../../../../../../us-east-1/dev/finance/data/service-1/network/endpoint-324",
    "../../../../../../../../us-east-1/staging/finance/data/service-2/monitoring/trace-collection-819",
    "../../../../../../../../eu-west-1/staging/operations/application/service-2/security/iam-505",
    "../../../../../../../../us-east-1/qa/marketing/application/service-1/compute/auto-scaling-199",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-610?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-610"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}