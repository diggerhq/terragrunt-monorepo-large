include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/application/service-2/application/event-bus-777",
    "../../../../../../../../eu-west-1/qa/finance/data/service-1/monitoring/alertmanager-511",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-3/storage/fsx-389",
    "../../../../../../../../us-west-2/staging/finance/platform/service-3/compute/eks-866",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//backup-468?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "backup-468"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}