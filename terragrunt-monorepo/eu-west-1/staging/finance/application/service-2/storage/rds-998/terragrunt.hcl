include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/data/service-1/network/direct-connect-738",
    "../../../../../../../../us-west-2/dev/finance/platform/service-3/application/load-balancer-749",
    "../../../../../../../../eu-west-1/dev/operations/application/service-2/network/direct-connect-672",
    "../../../../../../../../us-east-1/staging/marketing/application/service-3/application/load-balancer-985",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//rds-998?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "rds-998"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}