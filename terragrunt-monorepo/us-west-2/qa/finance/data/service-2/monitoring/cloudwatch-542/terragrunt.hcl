include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/platform/service-2/compute/lambda-712",
    "../../../../../../../../us-west-2/staging/marketing/data/service-2/security/certificates-617",
    "../../../../../../../../us-west-2/dev/operations/data/service-1/monitoring/grafana-758",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-3/network/route-table-899",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-3/storage/rds-347",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cloudwatch-542?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cloudwatch-542"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}