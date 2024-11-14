include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/platform/service-3/compute/batch-696",
    "../../../../../../../../us-east-1/dev/finance/platform/service-1/security/guardduty-146",
    "../../../../../../../../eu-west-1/staging/operations/application/service-1/storage/rds-922",
    "../../../../../../../../us-east-1/qa/marketing/data/service-1/security/guardduty-132",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-529?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-529"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}