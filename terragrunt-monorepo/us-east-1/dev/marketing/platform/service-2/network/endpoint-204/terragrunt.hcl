include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/application/service-2/monitoring/log-aggregation-709",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-1/application/api-gateway-276",
    "../../../../../../../../us-west-2/dev/operations/data/service-3/compute/ec2-561",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//endpoint-204?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "endpoint-204"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}