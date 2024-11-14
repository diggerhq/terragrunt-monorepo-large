include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = [
    "../../../../../../../../us-east-1/dev/marketing/platform/service-2/security/shield-139",
    "../../../../../../../../eu-west-1/qa/marketing/data/service-2/monitoring/cloudwatch-807",
    "../../../../../../../../eu-west-1/staging/finance/application/service-1/network/nacl-3",
    "../../../../../../../../us-east-1/qa/finance/application/service-3/compute/eks-831",
    "../../../../../../../../eu-west-1/qa/marketing/application/service-1/security/secrets-746",
  ]
}

terraform {
  source = "git::git@github.com/example/terraform-modules.git//nacl-731?ref=v1.0.0"
}

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars  = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  name = "nacl-731"
  environment = local.env_vars.locals.environment
  region = local.region_vars.locals.aws_region
  tags = {
    BusinessUnit = "finance"
    ServiceCategory = "platform"
    Environment = local.env_vars.locals.environment
    ManagedBy = "terragrunt"
  }
}