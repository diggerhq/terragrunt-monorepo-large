include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/application/service-1/monitoring/alertmanager-563",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-2/storage/fsx-325",
    "../../../../../../../../us-west-2/staging/operations/platform/service-3/compute/ec2-658",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-168?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-168"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}