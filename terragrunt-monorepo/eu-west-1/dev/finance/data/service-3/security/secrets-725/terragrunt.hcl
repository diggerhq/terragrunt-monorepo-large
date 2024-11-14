include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/application/service-2/compute/spot-fleet-579",
    "../../../../../../../../us-east-1/dev/marketing/application/service-3/monitoring/grafana-603",
    "../../../../../../../../us-west-2/staging/finance/platform/service-3/storage/redshift-918",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//secrets-725?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "secrets-725"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}