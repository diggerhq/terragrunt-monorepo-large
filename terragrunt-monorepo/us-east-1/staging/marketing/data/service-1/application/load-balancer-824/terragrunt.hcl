include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/application/service-1/compute/spot-fleet-637",
    "../../../../../../../../us-east-1/dev/operations/data/service-1/security/iam-435",
    "../../../../../../../../us-east-1/qa/marketing/data/service-3/network/direct-connect-869",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-824?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-824"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}