include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/platform/service-1/security/iam-537",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-3/application/service-mesh-328",
    "../../../../../../../../us-east-1/qa/operations/application/service-2/monitoring/grafana-739",
    "../../../../../../../../us-east-1/staging/operations/data/service-1/security/security-hub-817",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-3/network/transit-gateway-939",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//guardduty-507?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "guardduty-507"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}