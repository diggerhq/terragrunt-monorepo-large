include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/dev/finance/application/service-2/compute/lambda-717",
    "../../../../../../../../us-west-2/dev/finance/platform/service-1/security/certificates-852",
    "../../../../../../../../us-east-1/staging/marketing/application/service-1/security/waf-24",
    "../../../../../../../../us-east-1/staging/finance/application/service-2/compute/batch-28",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cloudwatch-661?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cloudwatch-661"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}