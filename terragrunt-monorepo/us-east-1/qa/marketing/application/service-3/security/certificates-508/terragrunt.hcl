include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/operations/data/service-2/application/service-mesh-658",
    "../../../../../../../../eu-west-1/qa/finance/platform/service-1/monitoring/trace-collection-473",
    "../../../../../../../../eu-west-1/qa/operations/platform/service-3/network/endpoint-677",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//certificates-508?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "certificates-508"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}