include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/data/service-2/compute/auto-scaling-274",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-3/compute/spot-fleet-906",
    "../../../../../../../../us-west-2/staging/operations/application/service-1/security/certificates-837",
    "../../../../../../../../us-east-1/qa/finance/platform/service-2/compute/ec2-973",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//log-aggregation-149?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "log-aggregation-149"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}