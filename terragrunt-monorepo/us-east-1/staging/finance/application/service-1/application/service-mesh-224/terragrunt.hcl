include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/platform/service-2/monitoring/log-aggregation-237",
    "../../../../../../../../eu-west-1/qa/finance/data/service-1/network/direct-connect-354",
    "../../../../../../../../us-west-2/qa/operations/data/service-3/security/certificates-706",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-1/security/guardduty-347",
    "../../../../../../../../eu-west-1/dev/operations/application/service-2/monitoring/grafana-902",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-224?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-224"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}