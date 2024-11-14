include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/application/service-2/compute/auto-scaling-88",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-3/security/guardduty-368",
    "../../../../../../../../us-east-1/qa/finance/application/service-2/application/load-balancer-980",
    "../../../../../../../../eu-west-1/qa/operations/data/service-3/network/vpc-237",
    "../../../../../../../../us-east-1/staging/marketing/application/service-3/compute/lambda-523",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//nacl-266?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "nacl-266"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}