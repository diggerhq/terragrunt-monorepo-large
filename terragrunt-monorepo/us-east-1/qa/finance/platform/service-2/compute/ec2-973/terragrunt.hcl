include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/application/service-3/storage/backup-487",
    "../../../../../../../../us-west-2/qa/operations/platform/service-3/compute/auto-scaling-888",
    "../../../../../../../../us-east-1/qa/finance/platform/service-3/network/endpoint-309",
    "../../../../../../../../eu-west-1/dev/finance/application/service-1/application/api-gateway-335",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-973?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-973"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}