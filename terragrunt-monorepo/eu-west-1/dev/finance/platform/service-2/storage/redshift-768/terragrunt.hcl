include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/platform/service-2/monitoring/cloudwatch-825",
    "../../../../../../../../us-east-1/qa/marketing/application/service-2/compute/spot-fleet-497",
    "../../../../../../../../eu-west-1/dev/finance/data/service-3/monitoring/grafana-661",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//redshift-768?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "redshift-768"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}