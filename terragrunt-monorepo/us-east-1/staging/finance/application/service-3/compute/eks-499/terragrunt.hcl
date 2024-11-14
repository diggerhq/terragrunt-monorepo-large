include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/application/service-3/network/vpc-945",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-2/monitoring/log-aggregation-159",
    "../../../../../../../../eu-west-1/staging/finance/data/service-3/application/queue-995",
    "../../../../../../../../us-west-2/qa/operations/platform/service-1/monitoring/log-aggregation-151",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//eks-499?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "eks-499"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}