include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/dev/operations/application/service-2/security/waf-604",
    "../../../../../../../../eu-west-1/qa/operations/data/service-1/storage/fsx-407",
    "../../../../../../../../eu-west-1/staging/operations/platform/service-2/monitoring/cloudwatch-587",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//fargate-335?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "fargate-335"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}