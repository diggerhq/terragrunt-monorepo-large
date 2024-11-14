include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/data/service-2/application/event-bus-746",
    "../../../../../../../../us-east-1/dev/marketing/application/service-1/storage/backup-255",
    "../../../../../../../../us-west-2/dev/finance/data/service-2/security/iam-520",
    "../../../../../../../../eu-west-1/staging/finance/data/service-2/monitoring/cloudwatch-118",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//endpoint-8?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "endpoint-8"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}