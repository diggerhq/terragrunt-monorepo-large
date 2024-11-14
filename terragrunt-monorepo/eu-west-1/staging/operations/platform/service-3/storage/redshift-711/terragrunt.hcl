include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/data/service-2/compute/spot-fleet-310",
    "../../../../../../../../us-west-2/staging/operations/application/service-2/security/iam-824",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-3/monitoring/log-aggregation-159",
    "../../../../../../../../us-west-2/qa/marketing/application/service-2/security/waf-908",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//redshift-711?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "redshift-711"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}