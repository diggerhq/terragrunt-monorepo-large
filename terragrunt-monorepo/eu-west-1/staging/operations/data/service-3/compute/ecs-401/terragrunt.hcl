include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/application/service-3/storage/rds-51",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-3/compute/eks-351",
    "../../../../../../../../eu-west-1/qa/finance/data/service-3/monitoring/alertmanager-314",
    "../../../../../../../../us-east-1/dev/finance/data/service-2/security/security-hub-33",
    "../../../../../../../../us-west-2/qa/operations/platform/service-1/application/service-mesh-879",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ecs-401?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ecs-401"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}