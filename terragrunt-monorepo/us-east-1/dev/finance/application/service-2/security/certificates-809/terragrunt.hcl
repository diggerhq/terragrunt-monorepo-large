include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/platform/service-1/monitoring/grafana-517",
    "../../../../../../../../us-west-2/staging/operations/application/service-1/storage/s3-905",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-2/compute/spot-fleet-897",
    "../../../../../../../../us-east-1/dev/finance/application/service-1/storage/rds-848",
    "../../../../../../../../us-west-2/qa/finance/application/service-3/application/queue-659",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//certificates-809?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "certificates-809"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}