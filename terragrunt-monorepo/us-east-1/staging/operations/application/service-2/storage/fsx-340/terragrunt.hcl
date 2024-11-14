include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/application/service-2/storage/fsx-648",
    "../../../../../../../../us-east-1/staging/operations/data/service-2/monitoring/trace-collection-967",
    "../../../../../../../../us-east-1/staging/marketing/data/service-2/security/waf-85",
    "../../../../../../../../us-east-1/dev/marketing/application/service-3/network/route-table-712",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fsx-340?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fsx-340"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}