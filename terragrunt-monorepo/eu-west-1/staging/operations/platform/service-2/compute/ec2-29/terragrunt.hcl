include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/platform/service-3/security/secrets-162",
    "../../../../../../../../eu-west-1/qa/finance/application/service-3/storage/elasticache-98",
    "../../../../../../../../us-west-2/staging/finance/application/service-3/application/load-balancer-441",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-1/storage/s3-916",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-2/storage/redshift-167",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-29?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-29"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}