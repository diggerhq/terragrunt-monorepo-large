include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/marketing/application/service-2/storage/elasticache-228",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-3/security/shield-379",
    "../../../../../../../../us-east-1/staging/operations/application/service-2/storage/fsx-340",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cache-layer-771?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cache-layer-771"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}