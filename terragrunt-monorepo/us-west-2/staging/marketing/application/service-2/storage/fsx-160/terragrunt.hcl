include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/application/service-3/compute/auto-scaling-670",
    "../../../../../../../../us-east-1/dev/operations/platform/service-2/monitoring/trace-collection-834",
    "../../../../../../../../us-west-2/dev/operations/platform/service-1/compute/lambda-9",
    "../../../../../../../../us-east-1/staging/operations/platform/service-2/network/vpn-779",
    "../../../../../../../../us-west-2/qa/finance/application/service-2/application/queue-695",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fsx-160?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fsx-160"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}