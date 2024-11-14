include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/application/service-1/application/load-balancer-567",
    "../../../../../../../../us-west-2/staging/marketing/application/service-2/network/vpc-681",
    "../../../../../../../../us-west-2/staging/operations/application/service-1/compute/auto-scaling-800",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//alertmanager-254?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "alertmanager-254"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}