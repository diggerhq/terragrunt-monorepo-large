include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-1/compute/lambda-30",
    "../../../../../../../../eu-west-1/qa/finance/application/service-1/compute/ec2-39",
    "../../../../../../../../us-east-1/staging/operations/platform/service-3/monitoring/grafana-683",
    "../../../../../../../../us-east-1/staging/finance/platform/service-3/network/vpn-706",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//security-hub-956?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "security-hub-956"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}