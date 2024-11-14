include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/data/service-1/security/secrets-966",
    "../../../../../../../../us-west-2/staging/finance/platform/service-1/security/security-hub-350",
    "../../../../../../../../us-west-2/qa/marketing/data/service-1/monitoring/alertmanager-831",
    "../../../../../../../../eu-west-1/staging/finance/data/service-1/compute/ec2-214",
    "../../../../../../../../us-west-2/dev/operations/platform/service-3/compute/auto-scaling-924",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//guardduty-933?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "guardduty-933"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}