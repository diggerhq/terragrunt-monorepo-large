include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/data/service-1/application/api-gateway-12",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-3/security/security-hub-909",
    "../../../../../../../../us-east-1/staging/marketing/application/service-2/application/load-balancer-590",
    "../../../../../../../../us-east-1/staging/operations/application/service-3/application/cache-layer-878",
    "../../../../../../../../us-east-1/qa/operations/data/service-2/security/waf-116",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//secrets-528?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "secrets-528"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}