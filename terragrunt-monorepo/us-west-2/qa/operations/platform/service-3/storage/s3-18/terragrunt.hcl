include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/platform/service-3/network/subnet-212",
    "../../../../../../../../us-east-1/dev/finance/data/service-2/application/load-balancer-803",
    "../../../../../../../../us-west-2/qa/finance/platform/service-1/network/route-table-162",
    "../../../../../../../../us-west-2/staging/marketing/application/service-1/storage/backup-172",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-3/network/vpc-464",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//s3-18?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "s3-18"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}