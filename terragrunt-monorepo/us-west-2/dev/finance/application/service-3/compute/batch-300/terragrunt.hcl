include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/data/service-3/network/direct-connect-990",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-2/monitoring/alertmanager-748",
    "../../../../../../../../eu-west-1/staging/finance/application/service-1/application/service-mesh-250",
    "../../../../../../../../us-east-1/dev/finance/data/service-1/monitoring/alertmanager-985",
    "../../../../../../../../us-west-2/staging/finance/data/service-2/compute/batch-953",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//batch-300?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "batch-300"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}