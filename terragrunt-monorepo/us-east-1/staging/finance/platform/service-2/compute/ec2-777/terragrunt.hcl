include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/data/service-1/storage/rds-769",
    "../../../../../../../../us-west-2/qa/operations/data/service-1/storage/backup-285",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-2/storage/elasticache-230",
    "../../../../../../../../us-west-2/dev/finance/platform/service-2/storage/backup-261",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-1/monitoring/alertmanager-199",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-777?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-777"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}