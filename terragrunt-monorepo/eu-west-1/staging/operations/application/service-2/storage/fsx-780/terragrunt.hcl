include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/platform/service-1/application/load-balancer-862",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-1/storage/efs-355",
    "../../../../../../../../us-east-1/staging/operations/platform/service-3/monitoring/grafana-957",
    "../../../../../../../../us-west-2/staging/marketing/application/service-3/monitoring/log-aggregation-77",
    "../../../../../../../../us-east-1/dev/operations/application/service-3/security/security-hub-394",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fsx-780?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fsx-780"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}