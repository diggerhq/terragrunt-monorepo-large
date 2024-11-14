include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/application/service-1/compute/auto-scaling-567",
    "../../../../../../../../us-east-1/qa/finance/platform/service-1/monitoring/trace-collection-493",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-1/monitoring/trace-collection-600",
    "../../../../../../../../us-west-2/staging/operations/platform/service-1/storage/dynamodb-377",
    "../../../../../../../../us-west-2/staging/operations/data/service-2/storage/fsx-624",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpn-156?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpn-156"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}