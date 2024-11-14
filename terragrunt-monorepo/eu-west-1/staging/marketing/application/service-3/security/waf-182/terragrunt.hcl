include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/application/service-2/storage/efs-60",
    "../../../../../../../../eu-west-1/staging/operations/data/service-3/network/endpoint-707",
    "../../../../../../../../eu-west-1/dev/operations/application/service-3/storage/s3-672",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-1/security/guardduty-347",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-3/network/endpoint-401",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//waf-182?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "waf-182"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}