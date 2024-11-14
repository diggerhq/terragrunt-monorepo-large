include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/data/service-3/network/nacl-855",
    "../../../../../../../../eu-west-1/staging/operations/data/service-2/security/waf-158",
    "../../../../../../../../us-east-1/qa/operations/data/service-2/network/subnet-825",
    "../../../../../../../../us-east-1/dev/marketing/platform/service-2/storage/elasticache-361",
    "../../../../../../../../eu-west-1/staging/marketing/platform/service-3/application/api-gateway-897",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-143?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-143"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}