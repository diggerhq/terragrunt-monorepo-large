include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-2/storage/rds-383",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-3/compute/fargate-989",
    "../../../../../../../../us-east-1/dev/operations/application/service-1/security/certificates-910",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-1/storage/backup-353",
    "../../../../../../../../us-west-2/qa/operations/application/service-3/security/waf-651",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fsx-3?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fsx-3"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}