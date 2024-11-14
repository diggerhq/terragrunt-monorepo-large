include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/platform/service-2/monitoring/cloudwatch-990",
    "../../../../../../../../eu-west-1/staging/finance/application/service-2/application/cache-layer-61",
    "../../../../../../../../us-east-1/qa/marketing/data/service-3/monitoring/trace-collection-837",
    "../../../../../../../../us-west-2/qa/finance/platform/service-3/storage/elasticache-175",
    "../../../../../../../../us-east-1/staging/marketing/application/service-1/network/vpn-420",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//batch-696?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "batch-696"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}