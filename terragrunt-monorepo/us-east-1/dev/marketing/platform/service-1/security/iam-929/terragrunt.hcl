include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/data/service-3/compute/ecs-121",
    "../../../../../../../../eu-west-1/dev/finance/data/service-1/application/load-balancer-668",
    "../../../../../../../../us-east-1/qa/operations/data/service-3/application/load-balancer-419",
    "../../../../../../../../us-east-1/dev/marketing/application/service-1/monitoring/cloudwatch-327",
    "../../../../../../../../us-west-2/staging/finance/platform/service-2/storage/redshift-76",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//iam-929?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "iam-929"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}