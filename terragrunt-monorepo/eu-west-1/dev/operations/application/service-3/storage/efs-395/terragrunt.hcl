include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/data/service-3/security/security-hub-860",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-1/storage/efs-425",
    "../../../../../../../../us-west-2/qa/operations/platform/service-2/security/iam-896",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//efs-395?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "efs-395"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}