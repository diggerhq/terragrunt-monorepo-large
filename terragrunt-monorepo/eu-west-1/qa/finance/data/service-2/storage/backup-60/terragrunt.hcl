include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/platform/service-3/application/queue-188",
    "../../../../../../../../us-west-2/dev/operations/data/service-1/security/kms-457",
    "../../../../../../../../us-east-1/qa/marketing/platform/service-2/storage/rds-723",
    "../../../../../../../../us-west-2/dev/finance/application/service-2/application/queue-109",
    "../../../../../../../../us-east-1/qa/finance/platform/service-3/compute/ec2-823",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//backup-60?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "backup-60"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}