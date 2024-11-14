include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/application/service-3/storage/backup-6",
    "../../../../../../../../us-west-2/dev/operations/platform/service-3/application/service-mesh-181",
    "../../../../../../../../us-east-1/qa/finance/platform/service-2/network/vpc-670",
    "../../../../../../../../us-west-2/dev/operations/application/service-2/application/load-balancer-560",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cloudwatch-232?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cloudwatch-232"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}