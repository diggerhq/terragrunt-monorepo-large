include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/application/service-1/compute/lambda-607",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-1/network/nacl-201",
    "../../../../../../../../us-west-2/qa/finance/platform/service-3/compute/auto-scaling-611",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-77?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-77"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}