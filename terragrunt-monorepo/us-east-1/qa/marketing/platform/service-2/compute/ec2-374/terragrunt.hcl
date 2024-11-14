include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/application/service-3/application/event-bus-481",
    "../../../../../../../../us-east-1/qa/operations/data/service-1/network/vpn-670",
    "../../../../../../../../us-east-1/qa/finance/platform/service-1/storage/backup-942",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-2/storage/s3-886",
    "../../../../../../../../eu-west-1/dev/operations/platform/service-2/monitoring/log-aggregation-497",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-374?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-374"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}