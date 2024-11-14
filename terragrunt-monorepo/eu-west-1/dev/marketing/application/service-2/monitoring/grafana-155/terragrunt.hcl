include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/platform/service-1/storage/s3-966",
    "../../../../../../../../us-west-2/dev/finance/platform/service-1/compute/spot-fleet-678",
    "../../../../../../../../us-west-2/dev/operations/data/service-2/storage/rds-741",
    "../../../../../../../../us-east-1/staging/operations/platform/service-3/network/direct-connect-795",
    "../../../../../../../../eu-west-1/qa/operations/data/service-3/monitoring/cloudwatch-516",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-155?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-155"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}