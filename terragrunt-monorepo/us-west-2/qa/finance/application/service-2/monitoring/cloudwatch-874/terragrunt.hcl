include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/operations/platform/service-2/application/service-mesh-83",
    "../../../../../../../../us-west-2/qa/finance/application/service-3/security/security-hub-188",
    "../../../../../../../../us-east-1/dev/marketing/application/service-1/compute/lambda-290",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-1/application/api-gateway-951",
    "../../../../../../../../us-east-1/staging/operations/data/service-1/security/security-hub-817",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cloudwatch-874?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cloudwatch-874"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "application"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}