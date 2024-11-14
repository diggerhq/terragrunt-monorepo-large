include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/platform/service-2/security/kms-476",
    "../../../../../../../../eu-west-1/dev/operations/data/service-3/storage/s3-396",
    "../../../../../../../../us-west-2/staging/finance/application/service-2/storage/elasticache-531",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-1/compute/ec2-867",
    "../../../../../../../../us-east-1/staging/finance/application/service-1/application/service-mesh-224",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//redshift-646?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "redshift-646"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}