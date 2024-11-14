include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-1/monitoring/alertmanager-389",
    "../../../../../../../../us-west-2/staging/finance/application/service-1/network/nacl-843",
    "../../../../../../../../us-east-1/staging/finance/platform/service-3/compute/spot-fleet-445",
    "../../../../../../../../eu-west-1/dev/operations/application/service-3/monitoring/trace-collection-953",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cloudwatch-358?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cloudwatch-358"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}