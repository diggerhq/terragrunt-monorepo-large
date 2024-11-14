include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/data/service-3/network/route-table-730",
    "../../../../../../../../eu-west-1/qa/finance/application/service-3/network/vpn-867",
    "../../../../../../../../us-east-1/staging/marketing/data/service-3/compute/ecs-121",
    "../../../../../../../../us-east-1/staging/operations/application/service-1/network/vpc-368",
    "../../../../../../../../us-west-2/staging/finance/application/service-2/application/event-bus-859",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//eks-557?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "eks-557"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}