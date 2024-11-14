include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/application/service-2/compute/auto-scaling-991",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-2/compute/ecs-307",
    "../../../../../../../../us-west-2/dev/operations/data/service-2/compute/ecs-77",
    "../../../../../../../../us-east-1/staging/finance/platform/service-3/compute/batch-933",
    "../../../../../../../../us-east-1/dev/marketing/data/service-1/security/shield-530",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//backup-285?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "backup-285"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}