include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/platform/service-3/network/vpc-180",
    "../../../../../../../../us-east-1/staging/finance/data/service-1/application/service-mesh-524",
    "../../../../../../../../us-west-2/qa/finance/data/service-1/monitoring/prometheus-439",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-3/network/vpn-156",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//rds-279?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "rds-279"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}