include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/platform/service-1/monitoring/trace-collection-462",
    "../../../../../../../../us-east-1/qa/finance/data/service-1/storage/elasticache-860",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-1/security/iam-21",
    "../../../../../../../../eu-west-1/dev/operations/data/service-1/security/certificates-446",
    "../../../../../../../../us-west-2/dev/finance/data/service-1/network/endpoint-67",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpn-394?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpn-394"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}