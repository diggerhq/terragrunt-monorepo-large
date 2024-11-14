include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/data/service-2/storage/redshift-687",
    "../../../../../../../../us-west-2/dev/marketing/data/service-3/storage/fsx-215",
    "../../../../../../../../us-west-2/staging/marketing/data/service-3/application/event-bus-637",
    "../../../../../../../../us-east-1/qa/operations/application/service-2/security/certificates-127",
    "../../../../../../../../eu-west-1/staging/operations/application/service-3/storage/backup-875",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//subnet-778?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "subnet-778"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}