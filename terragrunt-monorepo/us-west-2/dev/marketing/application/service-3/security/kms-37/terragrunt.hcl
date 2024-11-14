include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/platform/service-3/network/endpoint-309",
    "../../../../../../../../us-east-1/qa/finance/platform/service-2/application/event-bus-77",
    "../../../../../../../../us-west-2/staging/finance/platform/service-2/network/route-table-933",
    "../../../../../../../../us-west-2/qa/finance/platform/service-2/security/kms-363",
    "../../../../../../../../us-east-1/qa/operations/data/service-1/compute/ec2-24",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//kms-37?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "kms-37"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}