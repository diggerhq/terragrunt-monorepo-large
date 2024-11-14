include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/platform/service-3/network/vpn-706",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-1/application/queue-85",
    "../../../../../../../../us-west-2/qa/finance/platform/service-1/security/waf-528",
    "../../../../../../../../us-east-1/dev/finance/data/service-3/security/waf-98",
    "../../../../../../../../us-east-1/qa/marketing/data/service-1/monitoring/grafana-975",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//guardduty-432?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "guardduty-432"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}