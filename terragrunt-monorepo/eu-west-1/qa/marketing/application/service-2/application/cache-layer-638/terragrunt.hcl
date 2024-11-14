include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/platform/service-2/monitoring/alertmanager-361",
    "../../../../../../../../us-east-1/dev/finance/platform/service-2/network/vpc-903",
    "../../../../../../../../us-east-1/staging/marketing/data/service-3/storage/elasticache-784",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-638?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-638"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}