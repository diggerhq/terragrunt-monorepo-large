include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/application/service-3/storage/backup-311",
    "../../../../../../../../us-east-1/qa/operations/data/service-1/compute/ec2-24",
    "../../../../../../../../us-west-2/staging/marketing/data/service-3/monitoring/prometheus-303",
    "../../../../../../../../us-east-1/qa/finance/application/service-3/monitoring/log-aggregation-277",
    "../../../../../../../../us-west-2/staging/finance/data/service-3/storage/fsx-174",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//redshift-732?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "redshift-732"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}