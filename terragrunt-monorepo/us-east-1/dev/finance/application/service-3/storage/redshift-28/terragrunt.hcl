include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/platform/service-2/application/cache-layer-732",
    "../../../../../../../../eu-west-1/dev/finance/data/service-1/security/waf-875",
    "../../../../../../../../eu-west-1/staging/finance/data/service-2/compute/fargate-726",
    "../../../../../../../../us-west-2/dev/operations/data/service-3/application/service-mesh-174",
    "../../../../../../../../us-east-1/dev/finance/data/service-1/network/nacl-643",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//redshift-28?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "redshift-28"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}