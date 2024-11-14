include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/platform/service-3/network/route-table-899",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-3/monitoring/grafana-500",
    "../../../../../../../../us-west-2/qa/finance/data/service-2/security/waf-606",
    "../../../../../../../../us-east-1/dev/marketing/data/service-1/storage/backup-620",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//efs-588?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "efs-588"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}