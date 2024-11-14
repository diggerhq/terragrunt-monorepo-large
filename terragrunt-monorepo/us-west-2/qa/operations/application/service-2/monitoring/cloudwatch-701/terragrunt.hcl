include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/application/service-2/storage/elasticache-361",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-3/compute/batch-855",
    "../../../../../../../../us-east-1/qa/finance/platform/service-3/security/shield-662",
    "../../../../../../../../us-west-2/staging/operations/application/service-1/network/direct-connect-201",
    "../../../../../../../../eu-west-1/qa/finance/data/service-2/security/iam-835",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cloudwatch-701?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cloudwatch-701"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}