include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/application/service-1/application/service-mesh-674",
    "../../../../../../../../eu-west-1/dev/finance/application/service-2/monitoring/log-aggregation-385",
    "../../../../../../../../us-west-2/qa/operations/platform/service-2/monitoring/cloudwatch-854",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//api-gateway-694?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "api-gateway-694"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}