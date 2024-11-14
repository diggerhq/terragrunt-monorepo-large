include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/data/service-3/network/direct-connect-990",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-3/storage/elasticache-671",
    "../../../../../../../../us-west-2/staging/finance/platform/service-1/compute/lambda-722",
    "../../../../../../../../us-west-2/dev/operations/data/service-2/security/guardduty-758",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//grafana-758?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "grafana-758"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}