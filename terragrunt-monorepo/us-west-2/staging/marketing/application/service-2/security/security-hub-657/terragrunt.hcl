include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/platform/service-3/compute/batch-444",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-3/storage/s3-738",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-3/storage/efs-574",
    "../../../../../../../../us-east-1/staging/marketing/data/service-2/monitoring/grafana-500",
    "../../../../../../../../us-west-2/qa/operations/platform/service-1/storage/elasticache-256",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//security-hub-657?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "security-hub-657"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}