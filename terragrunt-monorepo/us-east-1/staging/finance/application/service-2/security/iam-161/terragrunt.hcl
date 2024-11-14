include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/application/service-3/compute/spot-fleet-767",
    "../../../../../../../../eu-west-1/qa/finance/data/service-1/application/service-mesh-618",
    "../../../../../../../../us-east-1/qa/finance/application/service-2/application/load-balancer-980",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-1/storage/s3-93",
    "../../../../../../../../eu-west-1/dev/finance/application/service-1/compute/spot-fleet-13",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//iam-161?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "iam-161"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}