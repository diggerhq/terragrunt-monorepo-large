include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/application/service-2/monitoring/grafana-256",
    "../../../../../../../../us-west-2/staging/operations/application/service-2/storage/rds-686",
    "../../../../../../../../us-west-2/staging/marketing/data/service-1/security/guardduty-937",
    "../../../../../../../../us-west-2/dev/operations/data/service-2/compute/ecs-77",
    "../../../../../../../../us-east-1/dev/marketing/application/service-1/storage/backup-255",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//prometheus-440?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "prometheus-440"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}