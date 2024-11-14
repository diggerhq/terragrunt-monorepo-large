include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/platform/service-1/network/nacl-586",
    "../../../../../../../../us-east-1/qa/finance/application/service-2/compute/ec2-521",
    "../../../../../../../../us-west-2/qa/operations/data/service-3/storage/efs-304",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-3/compute/ecs-612",
    "../../../../../../../../us-west-2/staging/operations/platform/service-2/monitoring/prometheus-282",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//route-table-807?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "route-table-807"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}