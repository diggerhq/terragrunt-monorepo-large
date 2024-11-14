include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/application/service-1/monitoring/cloudwatch-689",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-2/storage/elasticache-230",
    "../../../../../../../../us-east-1/qa/operations/data/service-3/monitoring/alertmanager-871",
    "../../../../../../../../us-east-1/qa/operations/data/service-2/monitoring/log-aggregation-295",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//api-gateway-639?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "api-gateway-639"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}