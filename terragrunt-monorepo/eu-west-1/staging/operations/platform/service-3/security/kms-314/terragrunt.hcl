include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/data/service-3/monitoring/cloudwatch-658",
    "../../../../../../../../us-west-2/qa/marketing/application/service-3/compute/auto-scaling-123",
    "../../../../../../../../us-west-2/qa/marketing/application/service-1/security/certificates-843",
    "../../../../../../../../us-west-2/qa/finance/data/service-2/application/load-balancer-524",
    "../../../../../../../../us-west-2/qa/finance/platform/service-1/storage/redshift-387",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//kms-314?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "kms-314"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}