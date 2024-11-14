include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/finance/platform/service-3/compute/lambda-174",
    "../../../../../../../../us-east-1/staging/finance/application/service-3/security/guardduty-108",
    "../../../../../../../../us-east-1/dev/marketing/data/service-2/network/endpoint-15",
    "../../../../../../../../us-west-2/dev/finance/application/service-1/application/service-mesh-815",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//s3-371?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "s3-371"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}