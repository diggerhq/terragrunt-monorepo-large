include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/application/service-3/storage/redshift-319",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-2/network/subnet-79",
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-2/monitoring/alertmanager-708",
    "../../../../../../../../us-east-1/staging/finance/data/service-2/security/security-hub-194",
    "../../../../../../../../eu-west-1/qa/operations/application/service-2/network/vpc-211",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//prometheus-748?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "prometheus-748"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}