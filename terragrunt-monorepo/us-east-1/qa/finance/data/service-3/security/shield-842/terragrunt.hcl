include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/operations/data/service-3/storage/s3-396",
    "../../../../../../../../us-east-1/dev/finance/application/service-2/compute/fargate-975",
    "../../../../../../../../us-east-1/qa/operations/platform/service-3/application/api-gateway-748",
    "../../../../../../../../us-west-2/dev/operations/platform/service-1/security/waf-624",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//shield-842?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "shield-842"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}