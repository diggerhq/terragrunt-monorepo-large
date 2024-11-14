include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/data/service-3/application/queue-637",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-1/application/cache-layer-874",
    "../../../../../../../../us-east-1/dev/marketing/application/service-2/monitoring/alertmanager-166",
    "../../../../../../../../us-east-1/qa/finance/application/service-3/compute/fargate-710",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//transit-gateway-200?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "transit-gateway-200"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}