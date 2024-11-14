include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/finance/data/service-1/monitoring/trace-collection-327",
    "../../../../../../../../us-west-2/staging/finance/application/service-2/application/load-balancer-275",
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-2/application/event-bus-620",
    "../../../../../../../../us-east-1/dev/marketing/application/service-2/network/direct-connect-649",
    "../../../../../../../../us-east-1/qa/finance/application/service-1/application/api-gateway-336",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//s3-303?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "s3-303"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}