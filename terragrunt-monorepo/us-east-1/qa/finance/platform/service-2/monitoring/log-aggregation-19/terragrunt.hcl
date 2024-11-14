include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/data/service-3/compute/auto-scaling-615",
    "../../../../../../../../us-east-1/qa/operations/data/service-1/application/service-mesh-760",
    "../../../../../../../../us-west-2/qa/operations/data/service-3/security/certificates-706",
    "../../../../../../../../us-west-2/dev/operations/application/service-2/security/waf-604",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-19?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-19"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}