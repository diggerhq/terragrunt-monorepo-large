include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/application/service-3/network/subnet-85",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-2/monitoring/cloudwatch-358",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-1/storage/rds-459",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//transit-gateway-906?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "transit-gateway-906"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}