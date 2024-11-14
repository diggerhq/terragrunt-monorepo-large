include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/data/service-1/security/security-hub-293",
    "../../../../../../../../us-east-1/dev/finance/data/service-3/application/load-balancer-86",
    "../../../../../../../../eu-west-1/staging/operations/data/service-2/storage/rds-687",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-916?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-916"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}