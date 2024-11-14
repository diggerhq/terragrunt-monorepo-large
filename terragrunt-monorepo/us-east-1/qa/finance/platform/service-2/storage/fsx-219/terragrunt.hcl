include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/data/service-3/monitoring/prometheus-632",
    "../../../../../../../../eu-west-1/qa/operations/application/service-3/security/shield-868",
    "../../../../../../../../eu-west-1/dev/operations/application/service-3/storage/s3-672",
    "../../../../../../../../us-west-2/qa/finance/data/service-2/security/waf-595",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fsx-219?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fsx-219"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}