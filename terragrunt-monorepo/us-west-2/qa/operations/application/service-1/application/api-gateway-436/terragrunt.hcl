include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/application/service-1/security/kms-486",
    "../../../../../../../../us-west-2/qa/operations/platform/service-1/storage/elasticache-256",
    "../../../../../../../../us-east-1/dev/operations/data/service-1/application/queue-771",
    "../../../../../../../../eu-west-1/qa/operations/data/service-3/monitoring/prometheus-356",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//api-gateway-436?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "api-gateway-436"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}