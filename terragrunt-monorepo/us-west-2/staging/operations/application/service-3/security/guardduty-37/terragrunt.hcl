include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/application/service-3/security/iam-444",
    "../../../../../../../../eu-west-1/dev/operations/application/service-1/application/service-mesh-784",
    "../../../../../../../../us-east-1/qa/marketing/application/service-2/monitoring/grafana-900",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-2/security/security-hub-891",
    "../../../../../../../../us-east-1/qa/operations/application/service-1/storage/backup-744",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//guardduty-37?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "guardduty-37"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}