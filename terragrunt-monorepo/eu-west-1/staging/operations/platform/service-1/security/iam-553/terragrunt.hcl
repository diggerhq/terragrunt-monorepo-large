include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/data/service-2/application/service-mesh-797",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-3/security/kms-314",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-3/application/api-gateway-25",
    "../../../../../../../../us-west-2/dev/operations/platform/service-1/network/route-table-121",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-3/monitoring/alertmanager-870",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//iam-553?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "iam-553"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}