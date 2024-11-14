include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/data/service-2/security/security-hub-33",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-1/application/cache-layer-311",
    "../../../../../../../../us-east-1/dev/finance/application/service-3/storage/backup-740",
    "../../../../../../../../us-east-1/staging/marketing/data/service-1/network/endpoint-982",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-954?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-954"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}