include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../eu-west-1/qa/marketing/platform/service-1/application/load-balancer-341",
    "../../../../../../../../us-west-2/dev/operations/platform/service-2/security/secrets-854",
    "../../../../../../../../us-east-1/staging/marketing/application/service-2/application/load-balancer-590",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-587?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-587"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}