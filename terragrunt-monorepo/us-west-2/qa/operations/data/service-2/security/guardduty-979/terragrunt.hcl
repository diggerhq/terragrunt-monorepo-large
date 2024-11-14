include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/application/service-1/monitoring/alertmanager-380",
    "../../../../../../../../us-west-2/dev/operations/data/service-1/security/waf-849",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-1/monitoring/alertmanager-58",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-3/security/guardduty-368",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//guardduty-979?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "guardduty-979"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}