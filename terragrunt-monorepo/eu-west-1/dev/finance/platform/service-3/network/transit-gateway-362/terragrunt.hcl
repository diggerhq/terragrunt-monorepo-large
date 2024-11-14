include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/finance/application/service-2/application/service-mesh-168",
    "../../../../../../../../us-west-2/staging/marketing/platform/service-1/storage/fsx-436",
    "../../../../../../../../us-west-2/staging/marketing/data/service-2/security/security-hub-183",
    "../../../../../../../../us-east-1/dev/operations/data/service-1/storage/dynamodb-125",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//transit-gateway-362?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "transit-gateway-362"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}