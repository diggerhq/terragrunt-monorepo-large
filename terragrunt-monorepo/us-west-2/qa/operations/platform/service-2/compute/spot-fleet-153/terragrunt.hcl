include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/application/service-2/monitoring/trace-collection-446",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-3/security/security-hub-828",
    "../../../../../../../../eu-west-1/qa/finance/data/service-1/compute/batch-548",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-2/monitoring/grafana-914",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-1/storage/backup-353",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//spot-fleet-153?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "spot-fleet-153"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}