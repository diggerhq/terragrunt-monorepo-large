include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/platform/service-2/monitoring/cloudwatch-926",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-3/storage/backup-552",
    "../../../../../../../../us-west-2/dev/operations/application/service-3/security/waf-9",
    "../../../../../../../../us-east-1/staging/marketing/application/service-3/network/subnet-379",
    "../../../../../../../../eu-west-1/dev/operations/application/service-3/storage/backup-311",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fargate-630?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fargate-630"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}