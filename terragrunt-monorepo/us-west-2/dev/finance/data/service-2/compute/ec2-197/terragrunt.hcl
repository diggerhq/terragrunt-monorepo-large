include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/platform/service-3/storage/efs-634",
    "../../../../../../../../eu-west-1/qa/operations/data/service-2/compute/spot-fleet-299",
    "../../../../../../../../us-east-1/dev/marketing/data/service-1/security/waf-923",
    "../../../../../../../../us-west-2/staging/operations/platform/service-2/storage/fsx-846",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//ec2-197?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "ec2-197"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}