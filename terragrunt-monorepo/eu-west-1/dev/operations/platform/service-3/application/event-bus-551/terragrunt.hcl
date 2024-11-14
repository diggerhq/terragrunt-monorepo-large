include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/data/service-2/security/guardduty-887",
    "../../../../../../../../us-west-2/staging/finance/platform/service-1/security/guardduty-879",
    "../../../../../../../../eu-west-1/staging/finance/data/service-2/compute/fargate-342",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-1/storage/s3-542",
    "../../../../../../../../us-east-1/qa/marketing/application/service-3/monitoring/cloudwatch-767",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-551?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-551"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}