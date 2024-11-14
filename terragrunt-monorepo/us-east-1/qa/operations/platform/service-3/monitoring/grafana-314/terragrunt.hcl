include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/platform/service-1/application/api-gateway-667",
    "../../../../../../../../eu-west-1/staging/finance/data/service-2/compute/batch-708",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-2/storage/fsx-325",
    "../../../../../../../../us-west-2/staging/finance/platform/service-1/application/load-balancer-382",
    "../../../../../../../../eu-west-1/dev/finance/data/service-1/compute/spot-fleet-827",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-314?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-314"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}