include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/data/service-2/security/secrets-991",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-1/monitoring/alertmanager-759",
    "../../../../../../../../us-west-2/qa/operations/data/service-3/security/waf-520",
    "../../../../../../../../us-west-2/dev/finance/application/service-3/storage/efs-163",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//batch-692?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "batch-692"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}