include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/application/service-1/application/api-gateway-675",
    "../../../../../../../../us-west-2/staging/marketing/data/service-2/application/service-mesh-175",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-3/application/load-balancer-866",
    "../../../../../../../../us-west-2/qa/marketing/application/service-1/storage/backup-506",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-252?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-252"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}