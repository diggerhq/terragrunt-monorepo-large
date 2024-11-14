include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/application/service-3/application/cache-layer-556",
    "../../../../../../../../us-west-2/qa/marketing/application/service-1/security/certificates-843",
    "../../../../../../../../us-east-1/staging/finance/data/service-1/security/guardduty-185",
    "../../../../../../../../eu-west-1/staging/operations/application/service-3/monitoring/prometheus-536",
    "../../../../../../../../us-west-2/staging/finance/application/service-1/network/subnet-423",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpc-801?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpc-801"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}