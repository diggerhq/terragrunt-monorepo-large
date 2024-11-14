include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/platform/service-3/application/api-gateway-255",
    "../../../../../../../../us-west-2/dev/operations/platform/service-3/monitoring/cloudwatch-87",
    "../../../../../../../../us-west-2/dev/finance/application/service-2/monitoring/trace-collection-177",
    "../../../../../../../../us-east-1/qa/finance/data/service-3/network/direct-connect-887",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//waf-541?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "waf-541"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}