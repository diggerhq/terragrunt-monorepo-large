include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/data/service-2/storage/fsx-944",
    "../../../../../../../../us-east-1/dev/operations/platform/service-2/storage/dynamodb-913",
    "../../../../../../../../eu-west-1/dev/operations/data/service-2/monitoring/grafana-567",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-3/storage/backup-654",
    "../../../../../../../../eu-west-1/staging/finance/data/service-3/security/certificates-174",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//transit-gateway-205?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "transit-gateway-205"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}