include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/platform/service-3/security/security-hub-828",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-2/compute/spot-fleet-536",
    "../../../../../../../../us-west-2/staging/marketing/application/service-1/security/security-hub-387",
    "../../../../../../../../us-east-1/dev/finance/application/service-3/storage/redshift-698",
    "../../../../../../../../us-west-2/dev/marketing/application/service-1/monitoring/prometheus-118",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//subnet-767?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "subnet-767"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}