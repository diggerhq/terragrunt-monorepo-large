include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/application/service-1/compute/batch-208",
    "../../../../../../../../us-east-1/staging/finance/platform/service-2/monitoring/cloudwatch-998",
    "../../../../../../../../us-west-2/dev/finance/application/service-1/compute/auto-scaling-567",
    "../../../../../../../../us-east-1/qa/operations/platform/service-3/storage/efs-706",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-787?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-787"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}