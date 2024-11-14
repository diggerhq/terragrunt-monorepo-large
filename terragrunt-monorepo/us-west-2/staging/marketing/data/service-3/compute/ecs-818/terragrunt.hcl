include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/finance/platform/service-3/storage/dynamodb-57",
    "../../../../../../../../eu-west-1/qa/operations/application/service-3/monitoring/alertmanager-216",
    "../../../../../../../../us-west-2/qa/operations/platform/service-2/application/api-gateway-261",
    "../../../../../../../../us-west-2/dev/operations/platform/service-3/application/load-balancer-892",
    "../../../../../../../../us-east-1/dev/marketing/data/service-3/security/kms-743",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ecs-818?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ecs-818"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}