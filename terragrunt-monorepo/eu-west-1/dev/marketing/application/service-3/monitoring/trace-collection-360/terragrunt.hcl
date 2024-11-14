include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/marketing/platform/service-2/network/direct-connect-843",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-2/storage/dynamodb-238",
    "../../../../../../../../us-west-2/qa/marketing/platform/service-2/application/service-mesh-98",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-3/security/certificates-841",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//trace-collection-360?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "trace-collection-360"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}