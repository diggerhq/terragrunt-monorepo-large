include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/platform/service-2/network/endpoint-204",
    "../../../../../../../../us-west-2/dev/operations/data/service-1/security/guardduty-683",
    "../../../../../../../../us-west-2/staging/marketing/application/service-3/network/endpoint-124",
    "../../../../../../../../eu-west-1/staging/finance/application/service-2/monitoring/cloudwatch-168",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-716?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-716"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}