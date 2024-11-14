include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/operations/data/service-3/security/secrets-334",
    "../../../../../../../../eu-west-1/staging/marketing/data/service-3/storage/elasticache-713",
    "../../../../../../../../us-east-1/dev/finance/application/service-3/storage/redshift-698",
    "../../../../../../../../us-west-2/qa/marketing/data/service-1/network/subnet-596",
    "../../../../../../../../us-west-2/dev/marketing/application/service-3/storage/efs-841",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//prometheus-576?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "prometheus-576"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}