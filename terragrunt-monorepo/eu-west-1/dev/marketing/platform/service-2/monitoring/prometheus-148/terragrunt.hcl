include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/application/service-1/storage/rds-848",
    "../../../../../../../../eu-west-1/staging/finance/platform/service-3/storage/backup-687",
    "../../../../../../../../eu-west-1/qa/finance/data/service-1/storage/redshift-738",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-1/application/load-balancer-436",
    "../../../../../../../../us-east-1/qa/finance/data/service-1/application/queue-172",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//prometheus-148?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "prometheus-148"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}