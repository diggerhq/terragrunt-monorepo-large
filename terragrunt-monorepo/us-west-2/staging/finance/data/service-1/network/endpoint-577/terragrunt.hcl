include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/marketing/application/service-3/security/guardduty-3",
    "../../../../../../../../us-east-1/dev/marketing/data/service-2/network/transit-gateway-83",
    "../../../../../../../../us-east-1/qa/marketing/application/service-2/network/subnet-396",
    "../../../../../../../../us-east-1/dev/marketing/data/service-3/storage/s3-134",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//endpoint-577?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "endpoint-577"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "operations"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}