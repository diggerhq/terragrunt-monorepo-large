include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/application/service-3/monitoring/cloudwatch-712",
    "../../../../../../../../us-west-2/staging/finance/platform/service-2/network/route-table-933",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-2/application/cache-layer-938",
    "../../../../../../../../us-east-1/staging/marketing/data/service-2/compute/ec2-350",
    "../../../../../../../../us-west-2/staging/finance/data/service-3/network/nacl-266",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//shield-924?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "shield-924"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}