include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-west-2/qa/operations/application/service-1/security/waf-676",
    "../../../../../../../../eu-west-1/staging/finance/application/service-1/security/certificates-444",
    "../../../../../../../../us-east-1/staging/marketing/application/service-2/application/load-balancer-590",
    "../../../../../../../../us-west-2/qa/finance/data/service-2/compute/fargate-962",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//vpn-556?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "vpn-556"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "marketing"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}