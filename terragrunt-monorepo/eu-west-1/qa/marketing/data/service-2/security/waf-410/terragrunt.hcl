include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/application/service-3/compute/batch-855",
    "../../../../../../../../eu-west-1/qa/operations/application/service-2/application/service-mesh-219",
    "../../../../../../../../us-east-1/qa/operations/application/service-1/security/shield-698",
    "../../../../../../../../us-west-2/staging/finance/application/service-1/storage/rds-473",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-2/storage/s3-886",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//waf-410?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "waf-410"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}