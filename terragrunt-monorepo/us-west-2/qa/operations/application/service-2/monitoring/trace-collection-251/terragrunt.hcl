include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/application/service-1/application/cache-layer-619",
    "../../../../../../../../us-west-2/dev/marketing/application/service-2/application/queue-334",
    "../../../../../../../../us-east-1/qa/finance/application/service-3/security/shield-91",
    "../../../../../../../../us-east-1/dev/marketing/application/service-1/security/shield-912",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-251?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-251"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}