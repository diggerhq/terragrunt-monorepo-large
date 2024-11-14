include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/application/service-1/compute/spot-fleet-13",
    "../../../../../../../../us-east-1/qa/operations/application/service-2/compute/ec2-897",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-2/security/security-hub-507",
    "../../../../../../../../us-east-1/qa/marketing/application/service-2/monitoring/grafana-900",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-2/storage/rds-612",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//alertmanager-791?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "alertmanager-791"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}