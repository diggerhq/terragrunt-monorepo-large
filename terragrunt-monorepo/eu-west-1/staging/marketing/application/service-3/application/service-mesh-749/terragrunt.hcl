include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/platform/service-2/application/event-bus-923",
    "../../../../../../../../us-west-2/staging/operations/application/service-2/monitoring/grafana-620",
    "../../../../../../../../eu-west-1/dev/finance/application/service-3/network/nacl-273",
    "../../../../../../../../us-east-1/staging/marketing/application/service-3/storage/s3-305",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-749?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-749"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}