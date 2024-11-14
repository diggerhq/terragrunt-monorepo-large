include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/application/service-2/compute/lambda-135",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-1/network/nacl-201",
    "../../../../../../../../us-east-1/staging/operations/data/service-3/compute/spot-fleet-331",
    "../../../../../../../../us-west-2/dev/operations/platform/service-1/network/direct-connect-507",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-2/storage/elasticache-100",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-970?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-970"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}