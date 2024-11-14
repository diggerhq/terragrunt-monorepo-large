include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/finance/data/service-3/application/service-mesh-178",
    "../../../../../../../../us-east-1/qa/marketing/data/service-3/monitoring/trace-collection-978",
    "../../../../../../../../eu-west-1/dev/operations/application/service-3/application/cache-layer-60",
    "../../../../../../../../us-west-2/qa/finance/application/service-3/security/iam-625",
    "../../../../../../../../us-east-1/staging/marketing/application/service-1/security/waf-24",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//secrets-831?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "secrets-831"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}