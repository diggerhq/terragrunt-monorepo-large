include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/data/service-2/security/iam-671",
    "../../../../../../../../us-west-2/staging/marketing/application/service-2/security/security-hub-913",
    "../../../../../../../../us-west-2/dev/operations/platform/service-1/storage/s3-910",
    "../../../../../../../../eu-west-1/qa/finance/data/service-2/security/secrets-628",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fargate-944?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fargate-944"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}