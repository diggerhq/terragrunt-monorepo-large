include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/application/service-3/application/event-bus-578",
    "../../../../../../../../us-east-1/dev/finance/data/service-1/security/security-hub-491",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-3/network/vpc-4",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-1/application/cache-layer-107",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-3/storage/backup-931",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fargate-654?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fargate-654"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}