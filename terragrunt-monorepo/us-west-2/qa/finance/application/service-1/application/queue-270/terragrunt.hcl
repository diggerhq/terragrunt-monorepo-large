include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/application/service-3/application/queue-867",
    "../../../../../../../../eu-west-1/qa/finance/data/service-1/application/cache-layer-405",
    "../../../../../../../../us-east-1/staging/finance/platform/service-3/security/kms-923",
    "../../../../../../../../us-east-1/qa/marketing/data/service-2/application/load-balancer-611",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//queue-270?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "queue-270"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}