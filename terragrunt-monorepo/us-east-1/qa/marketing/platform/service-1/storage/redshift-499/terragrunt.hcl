include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/data/service-2/security/waf-410",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-3/security/security-hub-795",
    "../../../../../../../../us-west-2/qa/marketing/data/service-1/network/subnet-596",
    "../../../../../../../../us-east-1/qa/operations/platform/service-2/monitoring/trace-collection-744",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//redshift-499?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "redshift-499"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}