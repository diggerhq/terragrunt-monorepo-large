include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/operations/data/service-2/application/service-mesh-993",
    "../../../../../../../../us-west-2/qa/operations/application/service-3/network/direct-connect-51",
    "../../../../../../../../us-west-2/staging/operations/application/service-1/security/iam-514",
    "../../../../../../../../us-east-1/dev/finance/application/service-2/storage/efs-726",
    "../../../../../../../../us-east-1/dev/operations/data/service-2/application/api-gateway-367",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//service-mesh-322?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "service-mesh-322"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}