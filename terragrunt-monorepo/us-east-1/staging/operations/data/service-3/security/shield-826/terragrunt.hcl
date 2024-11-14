include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/staging/marketing/data/service-2/compute/fargate-449",
    "../../../../../../../../us-east-1/qa/operations/data/service-3/security/secrets-334",
    "../../../../../../../../eu-west-1/dev/finance/platform/service-2/security/guardduty-939",
    "../../../../../../../../us-west-2/dev/finance/application/service-2/application/load-balancer-450",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//shield-826?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "shield-826"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}