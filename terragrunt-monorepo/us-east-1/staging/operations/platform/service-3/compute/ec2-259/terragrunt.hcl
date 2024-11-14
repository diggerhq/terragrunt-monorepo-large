include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/platform/service-3/monitoring/trace-collection-571",
    "../../../../../../../../us-west-2/staging/marketing/data/service-1/storage/fsx-570",
    "../../../../../../../../eu-west-1/qa/operations/application/service-2/security/guardduty-977",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-259?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-259"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}