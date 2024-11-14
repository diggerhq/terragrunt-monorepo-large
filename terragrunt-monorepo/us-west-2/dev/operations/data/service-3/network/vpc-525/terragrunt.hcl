include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/data/service-1/security/guardduty-852",
    "../../../../../../../../eu-west-1/staging/finance/data/service-1/monitoring/grafana-982",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-3/monitoring/trace-collection-699",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-3/storage/efs-758",
    "../../../../../../../../eu-west-1/dev/finance/data/service-2/storage/elasticache-295",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpc-525?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpc-525"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}