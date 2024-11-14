include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/platform/service-2/network/endpoint-651",
    "../../../../../../../../us-west-2/staging/operations/application/service-1/security/shield-900",
    "../../../../../../../../us-east-1/qa/operations/application/service-1/monitoring/cloudwatch-941",
    "../../../../../../../../us-east-1/qa/finance/data/service-1/monitoring/grafana-55",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//waf-457?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "waf-457"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}