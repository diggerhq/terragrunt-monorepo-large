include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/data/service-1/compute/eks-965",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-1/application/event-bus-151",
    "../../../../../../../../us-east-1/dev/operations/data/service-2/compute/auto-scaling-405",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-3/security/iam-374",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//security-hub-44?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "security-hub-44"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}