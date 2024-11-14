include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/data/service-3/storage/fsx-850",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-3/security/shield-98",
    "../../../../../../../../us-east-1/staging/operations/application/service-1/application/service-mesh-421",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-2/compute/lambda-363",
    "../../../../../../../../us-west-2/qa/operations/application/service-3/storage/backup-163",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-352?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-352"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}