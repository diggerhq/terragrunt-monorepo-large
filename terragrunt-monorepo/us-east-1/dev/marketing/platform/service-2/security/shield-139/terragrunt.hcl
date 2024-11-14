include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/data/service-3/monitoring/grafana-585",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-1/network/direct-connect-448",
    "../../../../../../../../us-east-1/staging/operations/data/service-1/compute/ec2-531",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-1/compute/batch-208",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//shield-139?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "shield-139"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}