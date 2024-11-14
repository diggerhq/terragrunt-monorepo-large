include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/platform/service-2/network/nacl-247",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-1/storage/fsx-89",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-3/storage/elasticache-923",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-1/security/secrets-587",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//security-hub-254?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "security-hub-254"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}