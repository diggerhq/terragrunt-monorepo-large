include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/platform/service-1/monitoring/trace-collection-493",
    "../../../../../../../../us-west-2/dev/marketing/platform/service-3/compute/fargate-93",
    "../../../../../../../../us-west-2/staging/finance/platform/service-3/network/transit-gateway-986",
    "../../../../../../../../us-east-1/qa/finance/application/service-2/monitoring/alertmanager-923",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//efs-531?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "efs-531"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}