include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/application/service-2/compute/auto-scaling-399",
    "../../../../../../../../eu-west-1/qa/operations/data/service-3/application/api-gateway-375",
    "../../../../../../../../us-west-2/staging/marketing/application/service-3/storage/backup-396",
    "../../../../../../../../eu-west-1/staging/finance/data/service-2/storage/efs-702",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cloudwatch-801?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cloudwatch-801"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}