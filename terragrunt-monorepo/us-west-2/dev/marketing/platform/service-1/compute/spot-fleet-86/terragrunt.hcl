include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/application/service-3/security/iam-757",
    "../../../../../../../../us-east-1/dev/finance/data/service-3/application/service-mesh-832",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-1/storage/backup-353",
    "../../../../../../../../us-east-1/dev/finance/platform/service-1/application/api-gateway-945",
    "../../../../../../../../us-east-1/staging/finance/data/service-1/monitoring/log-aggregation-746",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//spot-fleet-86?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "spot-fleet-86"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}