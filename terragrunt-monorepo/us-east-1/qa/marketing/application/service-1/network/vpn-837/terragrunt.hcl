include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/platform/service-1/monitoring/alertmanager-855",
    "../../../../../../../../us-east-1/staging/finance/application/service-3/security/guardduty-108",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-2/monitoring/cloudwatch-602",
    "../../../../../../../../us-east-1/qa/operations/platform/service-1/storage/s3-63",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpn-837?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpn-837"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}