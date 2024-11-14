include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/platform/service-1/monitoring/alertmanager-258",
    "../../../../../../../../eu-west-1/staging/operations/application/service-3/network/endpoint-815",
    "../../../../../../../../us-east-1/dev/operations/application/service-1/monitoring/alertmanager-214",
    "../../../../../../../../us-west-2/staging/finance/application/service-2/compute/ec2-96",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//batch-464?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "batch-464"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}