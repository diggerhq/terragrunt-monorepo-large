include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/platform/service-3/monitoring/grafana-314",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-2/storage/fsx-639",
    "../../../../../../../../us-east-1/dev/marketing/data/service-1/monitoring/cloudwatch-611",
    "../../../../../../../../us-east-1/qa/operations/data/service-3/compute/auto-scaling-615",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//nacl-420?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "nacl-420"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}