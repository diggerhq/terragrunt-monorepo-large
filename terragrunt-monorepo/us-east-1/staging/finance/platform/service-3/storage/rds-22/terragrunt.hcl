include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/data/service-2/security/iam-656",
    "../../../../../../../../eu-west-1/dev/operations/data/service-2/network/direct-connect-564",
    "../../../../../../../../eu-west-1/staging/operations/application/service-1/application/cache-layer-619",
    "../../../../../../../../eu-west-1/qa/operations/data/service-3/security/kms-336",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-2/compute/fargate-664",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//rds-22?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "rds-22"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}