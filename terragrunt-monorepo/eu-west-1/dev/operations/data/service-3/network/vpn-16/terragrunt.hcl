include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/platform/service-1/security/iam-651",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-3/storage/elasticache-923",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-3/monitoring/cloudwatch-741",
    "../../../../../../../../us-west-2/qa/operations/application/service-3/security/security-hub-95",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpn-16?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpn-16"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}