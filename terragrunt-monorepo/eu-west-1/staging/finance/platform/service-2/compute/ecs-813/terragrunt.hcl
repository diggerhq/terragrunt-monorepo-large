include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/data/service-3/security/guardduty-365",
    "../../../../../../../../us-east-1/staging/finance/data/service-1/security/guardduty-185",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-3/network/vpc-464",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-1/monitoring/grafana-818",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ecs-813?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ecs-813"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}