include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/platform/service-1/network/endpoint-909",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-1/application/load-balancer-520",
    "../../../../../../../../eu-west-1/qa/finance/data/service-1/application/service-mesh-618",
    "../../../../../../../../us-west-2/staging/operations/platform/service-2/monitoring/cloudwatch-332",
    "../../../../../../../../us-west-2/staging/marketing/application/service-2/application/cache-layer-306",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//secrets-48?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "secrets-48"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}