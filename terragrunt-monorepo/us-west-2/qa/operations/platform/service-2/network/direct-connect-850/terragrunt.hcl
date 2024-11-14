include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/marketing/application/service-2/security/certificates-243",
    "../../../../../../../../us-east-1/staging/marketing/data/service-2/storage/s3-624",
    "../../../../../../../../us-east-1/qa/finance/data/service-3/compute/spot-fleet-955",
    "../../../../../../../../us-east-1/dev/marketing/data/service-2/security/iam-385",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//direct-connect-850?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "direct-connect-850"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}