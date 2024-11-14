include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/platform/service-2/monitoring/grafana-500",
    "../../../../../../../../eu-west-1/dev/finance/application/service-2/storage/s3-953",
    "../../../../../../../../us-west-2/qa/operations/platform/service-1/network/vpn-949",
    "../../../../../../../../us-east-1/staging/marketing/application/service-1/network/vpn-420",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//elasticache-810?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "elasticache-810"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}