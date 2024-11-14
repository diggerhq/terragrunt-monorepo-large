include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/platform/service-2/security/secrets-140",
    "../../../../../../../../us-east-1/dev/marketing/data/service-1/security/guardduty-138",
    "../../../../../../../../us-east-1/staging/finance/data/service-1/network/transit-gateway-39",
    "../../../../../../../../us-west-2/qa/operations/platform/service-3/monitoring/grafana-662",
    "../../../../../../../../us-west-2/staging/finance/data/service-1/compute/spot-fleet-18",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//batch-960?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "batch-960"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}