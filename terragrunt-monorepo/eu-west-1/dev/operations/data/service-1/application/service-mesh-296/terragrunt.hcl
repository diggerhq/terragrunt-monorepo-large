include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/platform/service-2/network/route-table-926",
    "../../../../../../../../eu-west-1/dev/operations/application/service-3/security/certificates-495",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-1/application/event-bus-151",
    "../../../../../../../../us-east-1/staging/finance/platform/service-2/storage/backup-314",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-296?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-296"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}