include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/application/service-2/network/vpc-430",
    "../../../../../../../../us-west-2/qa/finance/platform/service-1/storage/redshift-387",
    "../../../../../../../../us-west-2/dev/marketing/data/service-2/network/route-table-925",
    "../../../../../../../../us-west-2/dev/marketing/application/service-1/monitoring/prometheus-118",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-909?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-909"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}