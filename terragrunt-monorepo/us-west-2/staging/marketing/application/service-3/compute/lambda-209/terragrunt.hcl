include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/data/service-3/security/kms-426",
    "../../../../../../../../us-west-2/staging/operations/application/service-3/security/secrets-260",
    "../../../../../../../../eu-west-1/staging/finance/data/service-3/compute/ec2-993",
    "../../../../../../../../eu-west-1/staging/operations/application/service-3/storage/backup-875",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//lambda-209?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "lambda-209"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}