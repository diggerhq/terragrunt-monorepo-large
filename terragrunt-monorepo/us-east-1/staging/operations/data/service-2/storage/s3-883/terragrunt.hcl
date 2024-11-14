include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/application/service-2/storage/redshift-912",
    "../../../../../../../../us-east-1/dev/operations/platform/service-2/monitoring/trace-collection-596",
    "../../../../../../../../us-east-1/qa/marketing/application/service-2/security/security-hub-656",
    "../../../../../../../../us-west-2/qa/finance/data/service-2/network/endpoint-216",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-2/compute/batch-52",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//s3-883?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "s3-883"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}