include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-2/security/security-hub-973",
    "../../../../../../../../us-east-1/qa/operations/platform/service-3/monitoring/grafana-314",
    "../../../../../../../../us-east-1/dev/marketing/data/service-3/compute/auto-scaling-552",
    "../../../../../../../../us-east-1/staging/operations/data/service-1/network/transit-gateway-703",
    "../../../../../../../../eu-west-1/staging/operations/data/service-1/storage/redshift-732",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-613?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-613"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}