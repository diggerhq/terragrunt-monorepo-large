include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/application/service-3/application/service-mesh-472",
    "../../../../../../../../us-east-1/staging/finance/data/service-2/storage/elasticache-734",
    "../../../../../../../../us-east-1/staging/finance/application/service-1/security/guardduty-532",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-3/network/endpoint-498",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//kms-502?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "kms-502"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}