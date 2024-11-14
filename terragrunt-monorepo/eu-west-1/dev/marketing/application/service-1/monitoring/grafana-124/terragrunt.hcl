include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/platform/service-3/network/nacl-694",
    "../../../../../../../../us-east-1/qa/finance/platform/service-1/network/transit-gateway-990",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-1/network/vpn-164",
    "../../../../../../../../us-east-1/qa/finance/data/service-3/monitoring/prometheus-597",
    "../../../../../../../../us-east-1/qa/operations/data/service-3/security/guardduty-666",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-124?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-124"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}