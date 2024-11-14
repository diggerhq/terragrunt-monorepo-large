include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/application/service-1/network/vpc-147",
    "../../../../../../../../us-east-1/staging/finance/data/service-1/storage/fsx-820",
    "../../../../../../../../us-west-2/qa/marketing/data/service-1/application/load-balancer-589",
    "../../../../../../../../us-west-2/dev/operations/platform/service-3/application/load-balancer-892",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//spot-fleet-97?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "spot-fleet-97"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}