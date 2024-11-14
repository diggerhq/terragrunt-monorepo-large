include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/data/service-1/application/event-bus-928",
    "../../../../../../../../us-west-2/dev/marketing/application/service-2/network/vpc-303",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-1/monitoring/cloudwatch-174",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//prometheus-686?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "prometheus-686"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}