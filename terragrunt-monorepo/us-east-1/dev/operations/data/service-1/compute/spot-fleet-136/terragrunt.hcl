include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/platform/service-1/security/kms-757",
    "../../../../../../../../us-west-2/dev/finance/application/service-2/storage/backup-765",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-2/network/vpc-186",
    "../../../../../../../../us-east-1/dev/operations/data/service-2/application/event-bus-451",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//spot-fleet-136?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "spot-fleet-136"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}