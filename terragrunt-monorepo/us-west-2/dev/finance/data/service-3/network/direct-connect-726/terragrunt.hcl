include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/application/service-1/monitoring/grafana-937",
    "../../../../../../../../us-west-2/qa/operations/platform/service-2/monitoring/prometheus-878",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-2/monitoring/prometheus-148",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-1/application/load-balancer-5",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-1/security/waf-72",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//direct-connect-726?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "direct-connect-726"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}