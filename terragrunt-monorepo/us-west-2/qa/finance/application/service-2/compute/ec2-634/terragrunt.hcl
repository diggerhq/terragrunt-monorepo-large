include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/application/service-2/compute/auto-scaling-294",
    "../../../../../../../../us-east-1/dev/operations/data/service-1/security/kms-438",
    "../../../../../../../../us-west-2/staging/finance/platform/service-2/security/waf-71",
    "../../../../../../../../us-east-1/dev/operations/application/service-3/network/route-table-668",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-634?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-634"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}