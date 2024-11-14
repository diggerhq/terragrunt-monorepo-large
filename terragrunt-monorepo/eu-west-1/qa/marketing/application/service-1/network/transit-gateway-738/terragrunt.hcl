include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/data/service-2/network/transit-gateway-83",
    "../../../../../../../../us-west-2/qa/finance/application/service-2/storage/backup-711",
    "../../../../../../../../us-east-1/dev/operations/platform/service-2/monitoring/trace-collection-596",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//transit-gateway-738?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "transit-gateway-738"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}