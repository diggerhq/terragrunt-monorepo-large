include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/data/service-2/monitoring/trace-collection-945",
    "../../../../../../../../us-east-1/staging/marketing/data/service-3/security/guardduty-319",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-1/storage/fsx-436",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//security-hub-737?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "security-hub-737"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}