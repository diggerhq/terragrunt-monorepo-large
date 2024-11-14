include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/application/service-2/storage/efs-795",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-3/application/event-bus-605",
    "../../../../../../../../us-east-1/staging/operations/application/service-1/storage/fsx-747",
    "../../../../../../../../us-west-2/qa/finance/application/service-3/network/endpoint-358",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-1/network/direct-connect-275",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//certificates-866?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "certificates-866"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}