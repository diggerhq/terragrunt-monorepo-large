include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/application/service-1/storage/fsx-520",
    "../../../../../../../../us-west-2/qa/finance/data/service-3/compute/lambda-907",
    "../../../../../../../../us-east-1/staging/marketing/application/service-1/monitoring/grafana-905",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-1/security/secrets-71",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//transit-gateway-657?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "transit-gateway-657"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}