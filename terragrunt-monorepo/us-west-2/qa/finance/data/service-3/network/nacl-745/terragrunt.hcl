include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/data/service-2/compute/ec2-350",
    "../../../../../../../../us-east-1/staging/finance/data/service-2/monitoring/trace-collection-38",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-3/storage/dynamodb-451",
    "../../../../../../../../us-east-1/dev/operations/platform/service-2/network/vpn-676",
    "../../../../../../../../eu-west-1/dev/finance/data/service-1/application/queue-333",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//nacl-745?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "nacl-745"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}