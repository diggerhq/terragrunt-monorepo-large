include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/application/service-1/network/direct-connect-101",
    "../../../../../../../../us-west-2/staging/marketing/data/service-2/monitoring/alertmanager-535",
    "../../../../../../../../us-east-1/qa/finance/application/service-3/storage/backup-51",
    "../../../../../../../../eu-west-1/dev/operations/application/service-2/network/direct-connect-672",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-237?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-237"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}