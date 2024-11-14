include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/platform/service-2/network/nacl-555",
    "../../../../../../../../us-east-1/staging/operations/platform/service-3/storage/efs-472",
    "../../../../../../../../us-west-2/staging/finance/platform/service-3/network/transit-gateway-986",
    "../../../../../../../../us-west-2/qa/finance/data/service-3/application/load-balancer-431",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//guardduty-532?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "guardduty-532"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}