include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/operations/data/service-2/monitoring/trace-collection-340",
    "../../../../../../../../us-east-1/staging/finance/platform/service-3/monitoring/cloudwatch-272",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-2/application/cache-layer-722",
    "../../../../../../../../eu-west-1/dev/finance/data/service-3/security/secrets-616",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fsx-736?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fsx-736"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}