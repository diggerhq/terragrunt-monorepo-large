include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/application/service-2/storage/elasticache-81",
    "../../../../../../../../us-west-2/staging/finance/data/service-1/security/security-hub-836",
    "../../../../../../../../us-east-1/dev/operations/application/service-1/monitoring/prometheus-487",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//nacl-858?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "nacl-858"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}