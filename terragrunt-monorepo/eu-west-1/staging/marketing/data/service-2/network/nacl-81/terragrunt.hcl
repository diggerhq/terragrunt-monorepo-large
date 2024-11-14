include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/data/service-3/application/load-balancer-339",
    "../../../../../../../../us-west-2/dev/marketing/data/service-1/storage/rds-715",
    "../../../../../../../../us-west-2/qa/finance/data/service-3/security/iam-967",
    "../../../../../../../../us-east-1/qa/marketing/data/service-3/compute/fargate-298",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-2/network/vpn-946",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//nacl-81?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "nacl-81"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}