include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/data/service-2/monitoring/alertmanager-729",
    "../../../../../../../../us-east-1/qa/operations/data/service-3/application/load-balancer-419",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-1/application/queue-586",
    "../../../../../../../../eu-west-1/dev/operations/data/service-2/compute/spot-fleet-259",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cloudwatch-724?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cloudwatch-724"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}