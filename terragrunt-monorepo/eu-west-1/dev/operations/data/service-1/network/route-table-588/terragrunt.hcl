include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/platform/service-3/application/load-balancer-892",
    "../../../../../../../../us-east-1/dev/finance/platform/service-2/security/shield-877",
    "../../../../../../../../us-east-1/qa/finance/data/service-1/compute/ec2-400",
    "../../../../../../../../us-west-2/staging/operations/application/service-2/storage/efs-60",
    "../../../../../../../../us-west-2/qa/finance/application/service-2/storage/backup-711",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//route-table-588?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "route-table-588"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}