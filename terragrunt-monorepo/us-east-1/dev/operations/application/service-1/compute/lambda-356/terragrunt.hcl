include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/staging/operations/data/service-3/compute/ec2-782",
    "../../../../../../../../us-east-1/staging/operations/application/service-3/storage/redshift-485",
    "../../../../../../../../us-west-2/dev/marketing/data/service-3/storage/fsx-215",
    "../../../../../../../../us-east-1/dev/operations/application/service-1/security/certificates-910",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//lambda-356?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "lambda-356"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}