include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/application/service-2/network/endpoint-698",
    "../../../../../../../../us-west-2/dev/marketing/data/service-1/monitoring/prometheus-318",
    "../../../../../../../../us-west-2/staging/finance/data/service-2/network/endpoint-924",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-3/storage/elasticache-810",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//certificates-413?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "certificates-413"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}