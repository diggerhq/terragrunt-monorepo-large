include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/application/service-3/compute/batch-395",
    "../../../../../../../../us-west-2/staging/operations/platform/service-2/network/subnet-651",
    "../../../../../../../../us-west-2/dev/marketing/data/service-2/monitoring/trace-collection-417",
    "../../../../../../../../us-west-2/dev/operations/platform/service-2/security/kms-256",
    "../../../../../../../../us-east-1/qa/finance/application/service-1/application/cache-layer-265",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpc-901?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpc-901"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}