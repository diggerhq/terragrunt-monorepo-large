include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/data/service-3/security/certificates-703",
    "../../../../../../../../eu-west-1/dev/operations/data/service-1/application/service-mesh-909",
    "../../../../../../../../eu-west-1/qa/finance/data/service-2/security/iam-835",
    "../../../../../../../../us-east-1/qa/marketing/application/service-2/application/event-bus-777",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-3/monitoring/log-aggregation-159",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//dynamodb-150?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "dynamodb-150"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}