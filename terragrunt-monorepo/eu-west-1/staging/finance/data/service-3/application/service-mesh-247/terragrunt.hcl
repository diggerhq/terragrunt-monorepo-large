include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/application/service-1/application/load-balancer-9",
    "../../../../../../../../eu-west-1/qa/finance/application/service-1/security/guardduty-98",
    "../../../../../../../../eu-west-1/dev/finance/data/service-1/application/queue-333",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-3/monitoring/trace-collection-502",
    "../../../../../../../../eu-west-1/dev/marketing/data/service-1/application/cache-layer-803",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-247?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-247"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}