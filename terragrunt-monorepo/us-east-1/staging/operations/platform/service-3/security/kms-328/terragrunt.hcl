include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/platform/service-3/monitoring/trace-collection-232",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-1/application/service-mesh-980",
    "../../../../../../../../us-west-2/dev/operations/platform/service-1/storage/s3-910",
    "../../../../../../../../us-east-1/dev/operations/platform/service-2/storage/redshift-872",
    "../../../../../../../../us-west-2/qa/finance/platform/service-1/compute/batch-305",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//kms-328?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "kms-328"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}