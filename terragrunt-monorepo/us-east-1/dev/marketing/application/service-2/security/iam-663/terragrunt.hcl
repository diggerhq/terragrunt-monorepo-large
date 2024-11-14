include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/data/service-2/application/api-gateway-602",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-2/application/service-mesh-268",
    "../../../../../../../../us-east-1/dev/marketing/application/service-1/monitoring/cloudwatch-327",
    "../../../../../../../../us-east-1/dev/operations/application/service-3/application/event-bus-92",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-1/security/secrets-534",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//iam-663?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "iam-663"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}