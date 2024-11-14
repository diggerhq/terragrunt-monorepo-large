include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/platform/service-2/compute/ec2-833",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-2/storage/dynamodb-446",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-3/network/transit-gateway-76",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-131?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-131"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}