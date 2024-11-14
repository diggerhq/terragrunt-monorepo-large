include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/data/service-3/compute/spot-fleet-679",
    "../../../../../../../../eu-west-1/qa/finance/data/service-3/monitoring/alertmanager-314",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-1/monitoring/cloudwatch-830",
    "../../../../../../../../eu-west-1/staging/finance/data/service-2/application/api-gateway-126",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//efs-378?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "efs-378"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}