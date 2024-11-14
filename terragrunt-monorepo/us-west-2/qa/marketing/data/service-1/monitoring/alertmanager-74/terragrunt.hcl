include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/data/service-1/monitoring/cloudwatch-611",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-2/security/shield-566",
    "../../../../../../../../us-west-2/qa/finance/platform/service-1/monitoring/prometheus-303",
    "../../../../../../../../us-east-1/qa/finance/data/service-2/network/direct-connect-4",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//alertmanager-74?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "alertmanager-74"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}