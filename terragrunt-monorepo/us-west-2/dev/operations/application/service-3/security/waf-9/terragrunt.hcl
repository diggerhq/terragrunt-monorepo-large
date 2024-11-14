include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/platform/service-1/monitoring/prometheus-998",
    "../../../../../../../../us-west-2/dev/finance/application/service-1/compute/ec2-909",
    "../../../../../../../../eu-west-1/dev/operations/application/service-3/monitoring/alertmanager-151",
    "../../../../../../../../us-east-1/dev/marketing/data/service-1/security/guardduty-138",
    "../../../../../../../../us-west-2/qa/operations/data/service-1/security/kms-21",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//waf-9?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "waf-9"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}