include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/application/service-3/security/security-hub-140",
    "../../../../../../../../eu-west-1/staging/operations/data/service-2/storage/backup-991",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-1/network/transit-gateway-845",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-3/storage/dynamodb-875",
    "../../../../../../../../us-west-2/staging/finance/platform/service-1/application/load-balancer-625",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//dynamodb-65?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "dynamodb-65"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}