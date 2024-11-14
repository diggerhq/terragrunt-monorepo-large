include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/platform/service-3/monitoring/alertmanager-138",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-2/security/secrets-748",
    "../../../../../../../../eu-west-1/dev/marketing/application/service-3/application/load-balancer-771",
    "../../../../../../../../us-east-1/staging/marketing/data/service-2/monitoring/grafana-500",
    "../../../../../../../../us-east-1/dev/finance/application/service-2/compute/ecs-350",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//prometheus-397?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "prometheus-397"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}