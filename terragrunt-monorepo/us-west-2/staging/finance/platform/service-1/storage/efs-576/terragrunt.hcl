include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/platform/service-3/application/queue-710",
    "../../../../../../../../us-west-2/staging/marketing/data/service-2/storage/backup-816",
    "../../../../../../../../us-west-2/staging/finance/platform/service-1/security/security-hub-350",
    "../../../../../../../../us-west-2/staging/finance/platform/service-1/compute/ecs-926",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//efs-576?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "efs-576"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}