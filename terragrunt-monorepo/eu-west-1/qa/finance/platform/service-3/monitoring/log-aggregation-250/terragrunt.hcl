include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/data/service-3/network/direct-connect-655",
    "../../../../../../../../us-west-2/staging/operations/application/service-2/network/vpn-252",
    "../../../../../../../../us-west-2/dev/marketing/application/service-2/network/nacl-533",
    "../../../../../../../../us-west-2/dev/marketing/data/service-3/network/route-table-796",
    "../../../../../../../../us-east-1/qa/operations/application/service-1/security/kms-505",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-250?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-250"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}