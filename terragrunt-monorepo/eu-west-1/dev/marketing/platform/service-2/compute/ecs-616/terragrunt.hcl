include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/application/service-3/monitoring/alertmanager-45",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-2/storage/backup-190",
    "../../../../../../../../us-east-1/dev/finance/data/service-3/monitoring/trace-collection-825",
    "../../../../../../../../us-west-2/staging/operations/platform/service-1/compute/spot-fleet-9",
    "../../../../../../../../us-west-2/staging/finance/data/service-1/security/security-hub-836",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ecs-616?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ecs-616"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}