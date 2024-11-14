include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/platform/service-2/application/api-gateway-215",
    "../../../../../../../../us-east-1/qa/operations/data/service-3/storage/s3-173",
    "../../../../../../../../us-west-2/dev/marketing/data/service-2/security/certificates-611",
    "../../../../../../../../us-east-1/qa/operations/data/service-1/security/security-hub-555",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpc-264?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpc-264"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}