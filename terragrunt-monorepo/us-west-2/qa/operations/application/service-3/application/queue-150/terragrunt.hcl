include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/application/service-1/monitoring/cloudwatch-958",
    "../../../../../../../../us-west-2/staging/operations/platform/service-3/compute/ec2-658",
    "../../../../../../../../eu-west-1/dev/finance/application/service-2/storage/rds-739",
    "../../../../../../../../us-east-1/qa/marketing/application/service-1/security/kms-427",
    "../../../../../../../../us-east-1/qa/operations/data/service-2/monitoring/log-aggregation-295",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-150?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-150"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}