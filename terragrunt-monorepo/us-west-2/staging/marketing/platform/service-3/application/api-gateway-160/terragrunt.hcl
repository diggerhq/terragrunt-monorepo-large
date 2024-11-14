include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/data/service-3/storage/elasticache-266",
    "../../../../../../../../us-west-2/dev/marketing/data/service-3/storage/fsx-215",
    "../../../../../../../../us-east-1/staging/operations/application/service-2/monitoring/alertmanager-65",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//api-gateway-160?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "api-gateway-160"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}