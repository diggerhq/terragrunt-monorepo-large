include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/platform/service-2/storage/fsx-846",
    "../../../../../../../../eu-west-1/staging/operations/application/service-1/monitoring/log-aggregation-798",
    "../../../../../../../../us-west-2/dev/finance/platform/service-3/compute/eks-339",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//spot-fleet-18?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "spot-fleet-18"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}