include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/data/service-3/storage/s3-21",
    "../../../../../../../../us-west-2/dev/operations/platform/service-1/application/load-balancer-596",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-1/network/direct-connect-275",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-784?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-784"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}