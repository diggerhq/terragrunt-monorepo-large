include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/application/service-1/storage/fsx-203",
    "../../../../../../../../us-west-2/staging/operations/platform/service-2/compute/batch-547",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-1/network/vpn-493",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-2/monitoring/prometheus-748",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-2/network/route-table-317",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//nacl-956?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "nacl-956"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}