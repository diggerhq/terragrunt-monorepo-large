include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/platform/service-2/network/vpc-903",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-2/network/route-table-326",
    "../../../../../../../../us-east-1/qa/finance/platform/service-2/compute/ec2-973",
    "../../../../../../../../eu-west-1/dev/operations/data/service-3/application/queue-347",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-2/monitoring/cloudwatch-825",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//redshift-758?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "redshift-758"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}