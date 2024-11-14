include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/platform/service-2/compute/auto-scaling-954",
    "../../../../../../../../us-east-1/staging/finance/platform/service-2/application/api-gateway-640",
    "../../../../../../../../us-east-1/staging/operations/data/service-3/monitoring/cloudwatch-186",
    "../../../../../../../../us-west-2/qa/finance/platform/service-3/network/endpoint-776",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//security-hub-428?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "security-hub-428"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}