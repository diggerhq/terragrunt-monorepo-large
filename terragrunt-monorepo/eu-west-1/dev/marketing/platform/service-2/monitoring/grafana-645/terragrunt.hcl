include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/platform/service-1/storage/s3-916",
    "../../../../../../../../us-west-2/dev/finance/platform/service-1/compute/spot-fleet-678",
    "../../../../../../../../us-east-1/staging/finance/application/service-1/compute/spot-fleet-637",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-645?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-645"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}