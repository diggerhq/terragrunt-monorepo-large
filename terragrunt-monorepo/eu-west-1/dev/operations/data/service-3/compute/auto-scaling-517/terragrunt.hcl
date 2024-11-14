include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/qa/finance/data/service-3/application/service-mesh-273",
    "../../../../../../../../eu-west-1/dev/operations/application/service-1/application/load-balancer-56",
    "../../../../../../../../eu-west-1/staging/finance/data/service-3/security/certificates-174",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//auto-scaling-517?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "auto-scaling-517"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "data"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}