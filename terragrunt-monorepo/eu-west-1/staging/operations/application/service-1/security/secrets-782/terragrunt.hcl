include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-3/storage/dynamodb-724",
    "../../../../../../../../us-east-1/staging/operations/platform/service-1/security/secrets-742",
    "../../../../../../../../eu-west-1/staging/marketing/application/service-1/network/transit-gateway-676",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-2/storage/elasticache-859",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//secrets-782?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "secrets-782"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}