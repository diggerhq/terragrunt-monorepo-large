include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/application/service-3/application/service-mesh-423",
    "../../../../../../../../us-west-2/staging/marketing/data/service-3/application/event-bus-637",
    "../../../../../../../../eu-west-1/dev/finance/data/service-1/application/load-balancer-668",
    "../../../../../../../../us-west-2/staging/marketing/application/service-2/network/vpc-681",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cloudwatch-687?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cloudwatch-687"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}