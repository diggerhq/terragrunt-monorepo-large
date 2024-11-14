include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/data/service-2/security/certificates-292",
    "../../../../../../../../us-west-2/dev/operations/data/service-2/storage/redshift-859",
    "../../../../../../../../us-east-1/dev/marketing/data/service-2/storage/redshift-100",
    "../../../../../../../../us-east-1/staging/finance/data/service-1/application/event-bus-23",
    "../../../../../../../../us-west-2/staging/finance/data/service-2/storage/elasticache-193",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//event-bus-620?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "event-bus-620"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}