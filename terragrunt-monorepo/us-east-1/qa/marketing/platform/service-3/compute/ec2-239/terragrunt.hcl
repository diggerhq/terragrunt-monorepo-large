include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/platform/service-3/monitoring/cloudwatch-572",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-3/monitoring/alertmanager-9",
    "../../../../../../../../eu-west-1/dev/operations/application/service-1/network/nacl-600",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-239?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-239"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}