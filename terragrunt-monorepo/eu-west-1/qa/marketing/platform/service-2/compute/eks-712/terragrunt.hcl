include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/application/service-2/application/load-balancer-275",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-1/monitoring/trace-collection-27",
    "../../../../../../../../us-west-2/staging/operations/platform/service-3/network/nacl-655",
    "../../../../../../../../us-west-2/dev/operations/platform/service-1/monitoring/trace-collection-334",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//eks-712?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "eks-712"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}