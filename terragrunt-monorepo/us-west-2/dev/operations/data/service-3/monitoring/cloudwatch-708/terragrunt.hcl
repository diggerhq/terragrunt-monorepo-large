include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/finance/data/service-1/storage/fsx-820",
    "../../../../../../../../us-east-1/staging/marketing/platform/service-1/compute/fargate-640",
    "../../../../../../../../us-west-2/staging/marketing/application/service-1/security/kms-387",
    "../../../../../../../../us-west-2/qa/finance/platform/service-3/application/service-mesh-184",
    "../../../../../../../../us-west-2/dev/marketing/data/service-3/security/waf-451",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//cloudwatch-708?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "cloudwatch-708"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}