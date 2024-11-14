include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/platform/service-3/compute/fargate-614",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-1/application/cache-layer-675",
    "../../../../../../../../us-east-1/dev/finance/application/service-1/security/secrets-35",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-3/compute/batch-444",
    "../../../../../../../../us-west-2/staging/marketing/application/service-1/security/kms-387",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpc-556?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpc-556"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}