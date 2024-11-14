include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/data/service-2/storage/efs-231",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-3/monitoring/log-aggregation-112",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-2/compute/auto-scaling-149",
    "../../../../../../../../us-west-2/qa/finance/data/service-2/application/load-balancer-524",
    "../../../../../../../../us-west-2/qa/finance/application/service-1/security/certificates-296",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//backup-353?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "backup-353"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}