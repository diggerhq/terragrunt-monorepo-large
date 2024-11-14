include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/data/service-1/compute/spot-fleet-827",
    "../../../../../../../../us-east-1/dev/finance/platform/service-1/storage/dynamodb-464",
    "../../../../../../../../us-east-1/staging/operations/platform/service-1/storage/fsx-41",
    "../../../../../../../../eu-west-1/dev/operations/application/service-2/storage/efs-180",
    "../../../../../../../../eu-west-1/qa/finance/application/service-2/application/service-mesh-548",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-415?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-415"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}