include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/data/service-2/application/service-mesh-27",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-3/application/api-gateway-289",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-2/security/iam-170",
    "../../../../../../../../us-east-1/staging/marketing/data/service-3/application/queue-897",
    "../../../../../../../../us-east-1/staging/marketing/application/service-1/network/endpoint-47",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//load-balancer-335?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "load-balancer-335"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}