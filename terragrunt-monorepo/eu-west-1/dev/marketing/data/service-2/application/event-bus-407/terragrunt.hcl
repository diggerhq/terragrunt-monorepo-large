include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/platform/service-3/monitoring/alertmanager-539",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-3/compute/lambda-981",
    "../../../../../../../../us-west-2/dev/operations/data/service-1/security/kms-457",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-2/network/transit-gateway-906",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-1/storage/efs-355",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-407?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-407"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}