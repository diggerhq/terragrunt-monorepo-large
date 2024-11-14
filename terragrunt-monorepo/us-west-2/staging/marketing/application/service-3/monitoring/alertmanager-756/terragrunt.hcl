include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/data/service-1/compute/fargate-844",
    "../../../../../../../../us-west-2/qa/marketing/application/service-2/storage/fsx-771",
    "../../../../../../../../us-east-1/staging/finance/application/service-2/network/vpc-242",
    "../../../../../../../../us-west-2/staging/operations/platform/service-3/storage/redshift-800",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//alertmanager-756?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "alertmanager-756"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}