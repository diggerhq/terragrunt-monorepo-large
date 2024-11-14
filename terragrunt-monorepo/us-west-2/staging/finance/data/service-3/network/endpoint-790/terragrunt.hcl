include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/marketing/platform/service-1/compute/lambda-907",
    "../../../../../../../../us-west-2/dev/operations/application/service-2/monitoring/alertmanager-502",
    "../../../../../../../../us-west-2/qa/operations/data/service-3/application/service-mesh-84",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//endpoint-790?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "endpoint-790"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}