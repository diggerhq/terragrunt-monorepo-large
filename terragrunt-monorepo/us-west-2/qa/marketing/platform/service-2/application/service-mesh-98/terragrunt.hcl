include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/platform/service-2/monitoring/cloudwatch-359",
    "../../../../../../../../us-west-2/dev/finance/platform/service-1/compute/auto-scaling-420",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-2/monitoring/prometheus-54",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-1/network/endpoint-482",
    "../../../../../../../../us-west-2/staging/operations/platform/service-1/application/service-mesh-322",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-98?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-98"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}