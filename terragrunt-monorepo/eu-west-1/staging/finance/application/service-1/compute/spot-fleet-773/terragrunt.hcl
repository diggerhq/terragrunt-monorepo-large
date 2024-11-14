include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/platform/service-1/storage/efs-940",
    "../../../../../../../../us-west-2/staging/finance/application/service-2/security/iam-43",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-2/compute/ecs-131",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-3/storage/backup-551",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//spot-fleet-773?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "spot-fleet-773"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}