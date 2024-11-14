include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/platform/service-2/monitoring/alertmanager-719",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-3/compute/eks-351",
    "../../../../../../../../us-west-2/qa/finance/data/service-2/application/service-mesh-799",
    "../../../../../../../../eu-west-1/staging/finance/application/service-1/compute/auto-scaling-561",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//api-gateway-246?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "api-gateway-246"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}