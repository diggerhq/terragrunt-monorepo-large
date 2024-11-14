include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/data/service-2/monitoring/grafana-674",
    "../../../../../../../../eu-west-1/staging/finance/application/service-2/compute/ecs-372",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-1/security/iam-21",
    "../../../../../../../../us-west-2/staging/marketing/data/service-1/network/vpn-637",
    "../../../../../../../../us-east-1/staging/operations/application/service-3/network/subnet-958",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//elasticache-800?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "elasticache-800"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}