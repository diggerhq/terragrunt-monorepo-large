include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-1/network/nacl-873",
    "../../../../../../../../us-east-1/dev/marketing/data/service-1/network/route-table-806",
    "../../../../../../../../eu-west-1/dev/operations/data/service-2/network/direct-connect-564",
    "../../../../../../../../us-east-1/dev/operations/data/service-3/monitoring/trace-collection-250",
    "../../../../../../../../eu-west-1/staging/finance/data/service-1/monitoring/trace-collection-327",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-398?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-398"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}