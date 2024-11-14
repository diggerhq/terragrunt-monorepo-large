include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-2/storage/elasticache-45",
    "../../../../../../../../us-west-2/dev/operations/data/service-3/network/vpc-525",
    "../../../../../../../../us-east-1/dev/finance/platform/service-3/network/subnet-212",
    "../../../../../../../../us-east-1/qa/operations/application/service-2/security/waf-670",
    "../../../../../../../../eu-west-1/dev/finance/data/service-1/monitoring/prometheus-555",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//prometheus-704?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "prometheus-704"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}