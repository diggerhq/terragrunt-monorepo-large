include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/staging/finance/data/service-2/application/event-bus-746",
    "../../../../../../../../us-west-2/qa/operations/application/service-3/security/security-hub-95",
    "../../../../../../../../eu-west-1/staging/finance/application/service-1/application/load-balancer-460",
    "../../../../../../../../us-east-1/dev/marketing/data/service-1/security/guardduty-138",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//nacl-694?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "nacl-694"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "engineering"
    ServiceCategory = "security"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}