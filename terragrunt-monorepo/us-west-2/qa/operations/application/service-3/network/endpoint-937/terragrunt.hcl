include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/platform/service-2/monitoring/cloudwatch-358",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-1/application/cache-layer-530",
    "../../../../../../../../us-west-2/qa/operations/data/service-3/storage/elasticache-918",
    "../../../../../../../../us-west-2/staging/finance/application/service-1/network/subnet-423",
    "../../../../../../../../eu-west-1/qa/finance/application/service-3/security/shield-541",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//endpoint-937?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "endpoint-937"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}