include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/application/service-3/monitoring/log-aggregation-451",
    "../../../../../../../../us-west-2/staging/finance/platform/service-3/monitoring/cloudwatch-51",
    "../../../../../../../../us-west-2/qa/marketing/data/service-1/security/security-hub-163",
    "../../../../../../../../us-west-2/staging/finance/platform/service-3/network/nacl-311",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//eks-860?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "eks-860"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}