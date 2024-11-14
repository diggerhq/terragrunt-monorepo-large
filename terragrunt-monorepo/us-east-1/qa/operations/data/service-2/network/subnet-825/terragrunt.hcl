include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-2/network/route-table-317",
    "../../../../../../../../eu-west-1/dev/finance/data/service-1/compute/spot-fleet-281",
    "../../../../../../../../us-west-2/dev/finance/application/service-1/compute/auto-scaling-567",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-2/compute/lambda-85",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-1/application/load-balancer-649",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//subnet-825?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "subnet-825"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}