include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/application/service-2/network/transit-gateway-181",
    "../../../../../../../../us-east-1/staging/finance/platform/service-2/storage/s3-647",
    "../../../../../../../../eu-west-1/qa/operations/data/service-3/storage/backup-463",
    "../../../../../../../../us-west-2/qa/finance/application/service-3/compute/fargate-42",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-1/network/subnet-613",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//direct-connect-584?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "direct-connect-584"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}