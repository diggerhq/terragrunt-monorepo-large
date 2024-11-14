include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/application/service-1/monitoring/trace-collection-423",
    "../../../../../../../../us-east-1/staging/finance/data/service-1/security/iam-199",
    "../../../../../../../../us-west-2/staging/finance/data/service-2/storage/elasticache-250",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-1/storage/fsx-65",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//s3-445?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "s3-445"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}